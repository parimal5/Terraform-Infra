✅ Challenge 2: Public ALB + Private EC2 in a Secure 3-Tier Setup
🎯 Goal
Design an infrastructure that:

Hosts an internet-facing Application Load Balancer (ALB)

Routes traffic to private EC2 instances across multiple Availability Zones

Allows outbound internet access from private instances via a NAT Gateway

Uses modular and environment-based structure

Stores Terraform state remotely with locking

🔹 Networking
VPC with CIDR 10.0.0.0/16

    2 Public subnets (e.g., 10.0.1.0/24, 10.0.2.0/24) across 2 AZs

    2 Private subnets (e.g., 10.0.11.0/24, 10.0.12.0/24) across same 2 AZs

    Internet Gateway attached to VPC

    NAT Gateway in each public subnet for private subnet egress

    Route tables set up properly

🔹 Compute (App Layer)
2 EC2 instances in private subnets (across AZs)

    Use the same NGINX install_nginx.sh script for now

🔹 Load Balancer
Application Load Balancer in public subnets

    Target group with private EC2s

    Health checks on port 80

    Listener on HTTP port 80

🔹 Security Groups
ALB SG: Allow inbound 80 from internet

    EC2 SG: Allow inbound 80 only from ALB SG (not public)

    Outbound rules should allow internet for update/downloads

🔹 Backend + Config
Use remote backend (S3 + DynamoDB locking)

    Modular structure for VPC, EC2, SG, ALB, NAT

    environments/PROD/ should drive the deployment


                        +----------------------------+
                        |     Internet Gateway       |
                        +-------------+--------------+
                                      |
                        +-------------v-------------+
                        |     Public Subnet(s)      |
                        |  (ALB + NAT Gateway)      |
                        +-------------+-------------+
                                      |
                        +-------------v-------------+
                        |     Private Subnet(s)     |
                        |     (EC2 App Instances)   |
                        +---------------------------+
