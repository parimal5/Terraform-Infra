# Terraform-Infra

### ✅ **Challenge 1: Public EC2 with Basic Networking**

**Name:** `Single-Tier Public Web Server`
**Description:**
Provisioned a basic infrastructure with:

- VPC + public subnet
- EC2 instance running NGINX
- Internet Gateway
- Security group with restricted SSH and open HTTP

✅ **Goal:** Learn core Terraform structure, provisioning EC2, and public access setup.

---

### ✅ **Challenge 2: Private EC2 with Public ALB + NAT**

**Name:** `Two-Tier Web Architecture with ALB`
**Description:**
Built a two-tier app with:

- Public ALB in public subnets
- EC2 instances in private subnets
- NAT Gateway for outbound access
- Proper subnet routing and SGs

✅ **Goal:** Understand tiered design, secure subnet placement, NAT usage, and load balancing.

---

### ✅ **Challenge 3: Full 3-Tier Architecture with RDS**

**Name:** `Three-Tier Web App with Private RDS`
**Description:**
Provisioning (or working on) a production-style architecture with:

- Public ALB
- Private EC2 app tier
- Private RDS backend tier
- Subnet groups, NAT, DB subnet isolation

✅ **Goal:** Deploy highly available, secure, and layered AWS architecture — foundational for real-world production systems.
