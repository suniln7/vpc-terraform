# AWS VPC Infrastructure with Terraform

This repository contains Terraform configurations to deploy a fully functional AWS Virtual Private Cloud (VPC) setup. It leverages the `terraform-aws-modules/vpc/aws` module to simplify the creation and management of VPC resources, including:

- Public and private subnets across multiple availability zones
- NAT Gateway with Elastic IP for internet access from private subnets
- Flow logs to monitor and log VPC network traffic to CloudWatch
- Subnet configurations optimized for Amazon EKS (Elastic Kubernetes Service) integration
- Automatic tagging for resources based on environment (e.g., `dev`, `prod`)

## Features
- Configurable CIDR block and availability zones
- Public and private subnets with automatic IP assignment control
- Support for single NAT gateway with EIP reuse
- Flow log configuration with CloudWatch integration
- Kubernetes-compatible subnet tags for internal and external load balancers

## Prerequisites
- AWS account with appropriate IAM permissions
- Terraform >= 1.0.0

## Usage
1. Clone the repository:
   ```bash
   terraform init
   terraform apply -var-file="vars/variables.dev.tfvars"

