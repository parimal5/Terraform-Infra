module "vpc" {
  source               = "../../modules/vpc"
  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
}

module "subnets" {
  source  = "../../modules/subnets"
  vpc_id  = module.vpc.vpc_id
  subnets = var.subnets
}

module "igw" {
  source = "../../modules/igw"
  vpc_id = module.vpc.vpc_id
}

module "eip" {
  source    = "../../modules/elasticIP"
  eip_names = var.eip_names
}

module "nat" {
  source = "../../modules/nat"

  ngw = {
    "nat-az1" = {
      subnet_id     = module.subnets.public_subnets["public-1"]
      allocation_id = module.eip.eip_ids["eip-1"]
    },
    "nat-az2" = {
      subnet_id     = module.subnets.public_subnets["public-2"]
      allocation_id = module.eip.eip_ids["eip-2"]
    }
  }

  depends_on = [module.igw]
}


module "routeTable" {
  source            = "../../modules/routeTable"
  vpc_id            = module.vpc.vpc_id
  igw_id            = module.igw.awsIGW_ID
  ngw_ids           = module.nat.nat_gateway_ids
  public_subnet_ids = module.subnets.public_subnets
  private_subnet_map = {
    "private-1" = {
      subnet_id = module.subnets.private_subnets["private-1"]
      nat_key   = "nat-az1"
    }
    "private-2" = {
      subnet_id = module.subnets.private_subnets["private-2"]
      nat_key   = "nat-az2"
    }
  }
}

module "securityGroup" {
  source = "../../modules/sg"
  SG = [
    {
      name        = "alb-sg"
      description = "Allow HTTP from internet"
      vpc_id      = module.vpc.vpc_id
    },
    {
      name        = "ec2-sg"
      description = "Allow HTTP from ALB only"
      vpc_id      = module.vpc.vpc_id
    }
  ]
  rules = var.rules
}

module "ec2_instance" {
  source = "../../modules/ec2"
  ec2_instance = [
    {
      instance_type               = "t2.micro"
      key_name                    = "your-key"
      monitoring                  = true
      security_group              = [module.securityGroup.security_group_ids["ec2-sg"]]
      subnet_id                   = module.subnets.private_subnets["private-1"]
      user_data                   = file("../../scripts/install_nginx.sh")
      associate_public_ip_address = false
      volume_size                 = 8
      volume_type                 = "gp2"
    },
    {
      instance_type               = "t2.micro"
      key_name                    = "your-key"
      monitoring                  = true
      security_group              = [module.securityGroup.security_group_ids["ec2-sg"]]
      subnet_id                   = module.subnets.private_subnets["private-2"]
      user_data                   = file("../../scripts/install_nginx.sh")
      associate_public_ip_address = false
      volume_size                 = 8
      volume_type                 = "gp2"
    }
  ]
}

module "application_load_balancer" {
  source = "../../modules/alb"

  load_balancer = {
    "alb-1" = {
      name               = "dev-alb"
      internal           = false
      load_balancer_type = "application"
      security_groups    = [module.securityGroup.security_group_ids["alb-sg"]]
      subnets            = values(module.subnets.public_subnets)
    }
  }

  lb_target_group = {
    "tg-1" = {
      name                = "dev-tg"
      port                = 80
      protocol            = "HTTP"
      target_type         = "instance"
      vpc_id              = module.vpc.vpc_id
      path                = "/"
      matcher             = "200"
      interval            = 30
      timeout             = 5
      healthy_threshold   = 2
      unhealthy_threshold = 2
    }
  }

  lb_listener = {
    "listener-1" = {
      load_balancer_arn = module.application_load_balancer.alb_arns["alb-1"]
      port              = 80
      protocol          = "HTTP"
      type              = "forward"
      target_group_arn  = module.application_load_balancer.target_group_arns["tg-1"]
    }
  }
}
