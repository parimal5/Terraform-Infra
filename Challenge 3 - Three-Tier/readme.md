                     Internet
                         │
              ┌──────────▼───────────┐
              │   Public Subnets     │  ← ALB + NAT Gateways
              └─────┬───────┬────────┘
                    │       │
        ┌───────────▼───────▼───────────┐
        │        Private Subnets        │  ← EC2 App Tier
        └───────────┬───────┬───────────┘
                    │       │
               ┌────▼───────▼────┐
               │   RDS Subnets   │  ← DB Tier (No Internet Access)
               └─────────────────┘

✅ Challenge 3: Multi-Tier Web App with RDS – From Scratch

This challenge assumes zero re-use — everything is fresh. You'll provision:

VPC and networking (public, private, DB subnets)

Internet Gateway + NAT Gateway(s)

EC2 instances in app layer (private)

Application Load Balancer (public)

Amazon RDS instance (MySQL/Postgres in private DB subnets)

Proper routing + security groups

Remote backend config (S3 + DynamoDB)

🧱 SECTION 1: Networking Setup

1.  VPC
    CIDR: 10.0.0.0/16

2.  Subnets
    Public Subnets (for ALB + NAT GW):

        10.0.1.0/24 (AZ1)

        10.0.2.0/24 (AZ2)

    Private App Subnets (for EC2):

        10.0.11.0/24 (AZ1)

        10.0.12.0/24 (AZ2)

    Private DB Subnets (for RDS):

        10.0.21.0/24 (AZ1)

        10.0.22.0/24 (AZ2)

🔒 DB subnets must not have a route to the Internet Gateway.

3. Internet Gateway
   Attach to VPC

   Route 0.0.0.0/0 in public subnet route tables

4. NAT Gateways
   Deploy 1 or 2 (for redundancy)

   In public subnets

   Attach Elastic IPs

   Add route to 0.0.0.0/0 in private subnet route tables pointing to NAT GW

🧱 SECTION 2: EC2 App Layer

1. EC2 Instances
   2 EC2 instances (Amazon Linux or Ubuntu) in private subnets

   Use user_data to install and run NGINX or a placeholder app

   Outbound internet needed → NAT GW routing required

2. Security Group
   Inbound HTTP (80) only from ALB Security Group

   Outbound → allow all (for updates, etc.)

🧱 SECTION 3: Application Load Balancer

1. ALB
   Public-facing

   Deployed across 2 public subnets

   Listener: HTTP on port 80

2. Target Group
   Register private EC2 instances

   Health check path: /

3. Security Group
   Inbound: 80 from 0.0.0.0/0 (internet)

   Outbound: to EC2 on port 80

🧱 SECTION 4: Amazon RDS

1. RDS Instance
   Engine: MySQL or PostgreSQL

   Deployed in private DB subnets

   Public access: false

   Multi-AZ: optional (if you want HA)

   Use db.t3.micro for cost control

   Set:

   Allocated storage: 20GB

   Backup retention: 7+ days

   Storage encryption: enabled

2. DB Subnet Group
   Use the 2 DB subnets to create aws_db_subnet_group

3. Security Group
   Inbound: DB port (3306 or 5432) only from EC2 SG

   Outbound: unnecessary (can be blocked or default)
