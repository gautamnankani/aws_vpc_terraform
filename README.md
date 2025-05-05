# **AWS VPC using Terraform**

## **Module: VPC**
**Directory:** `modules/vpc`

This module sets up the following:
- **VPC** with three subnets: **public**, **private**, and **isolated**.
- **Internet Gateway** and **NAT Gateway** for the public subnet.
- **Route Table Configurations**:
  - **Public subnet**: Uses Local Routing and an **Internet Gateway** for traffic.
  - **Private subnet**: Uses Local Routing and a **NAT Gateway** for traffic.
  - **Isolated subnet**: Uses **Local Routing** only.

---

## **Module: EC2**
**Directory:** `modules/ec2`

This module provisions:
- **Security Group** within the VPC (allowing all ingress and egress traffic).
- **AWS Key Pair** for secure SSH access.
- **EC2 Instances**:
  - 1 instance in the **public subnet**.
  - 1 instance in the **private subnet**.
  - 1 instance in the **isolated subnet**.

---

## **Main Execution**
**Directory:** `main`

Use the VPC module to create the VPC.

```bash
cd main
# Update credentials: access key, secret key, and region values in main.tf
terraform init
terraform plan
terraform apply
```
---

## *Testing EC2 Execution**
**Directory:** `test`

Use the EC2 module to launch instances.

```bash
cd test
# Update credentials: access key, secret key, and region values in main.tf
terraform init
terraform plan
terraform apply
```