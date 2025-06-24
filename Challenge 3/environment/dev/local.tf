locals {
  nat_gatway = {
    "nat-1" = {
      allocation_id = module.elastic_ips.elastic_ip["eip-1"]
      subnet_id     = module.subnets.public_subnet_ids["public-subnet-1"]
    },
    "nat-2" = {
      allocation_id = module.elastic_ips.elastic_ip["eip-2"]
      subnet_id     = module.subnets.public_subnet_ids["public-subnet-2"]
    }
  }

  nat_gateway_routeTable = {
    "private-subnet-1" = {
      nat_gateway_ids = module.nat_gatway.NAT_ID["nat-1"]
    },
    "private-subnet-2" = {
      nat_gateway_ids = module.nat_gatway.NAT_ID["nat-2"]
    }
  }


  ec2_instance = {
    "ec2_instance_1" = {
      instance_type               = "t3.micro"
      key_name                    = "mykey.pem"
      volume_type                 = "gp3"
      monitoring                  = true
      associate_public_ip_address = true
      volume_size                 = 8
      subnet_id                   = module.subnets.public_subnet_ids["public-subnet-1"]
      security_groups             = [module.security_group.security_group_ids["ec2-sg"]]
    },
    "ec2_instance_2" = {
      instance_type               = "t3.micro"
      key_name                    = "mykey.pem"
      volume_type                 = "gp3"
      monitoring                  = true
      associate_public_ip_address = true
      volume_size                 = 8
      subnet_id                   = module.subnets.public_subnet_ids["public-subnet-2"]
      security_groups             = [module.security_group.security_group_ids["ec2-sg"]]
    }
  }
  load_balancers = {
    "alb-1" = {
      name                       = "MyLB"
      internal                   = false
      load_balancer_type         = "application"
      subnets                    = values(module.subnets.public_subnet_ids)
      enable_deletion_protection = true
      security_groups            = [module.security_group.security_group_ids["alb-sg"]]
    }
  }

  lb_listener = {
    "alb-1-listner" = {
      load_balancer_arn = module.application_load_balancer.load_balancer_arn["alb-1"]
      port              = 80
      protocol          = "http"
      type              = "forward"
      target_group_arn  = module.application_load_balancer.target_group_arn["lb-tg-1"]
    }
  }
}
