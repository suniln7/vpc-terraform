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

## Continuous Integration and Deployment (CI/CD)
This project leverages GitLab CI/CD for automated infrastructure provisioning using Terraform. The CI/CD pipeline ensures that changes are validated, planned, and applied in a controlled and automated manner.

### GitLab CI Pipeline Stages:
1. **Check**: Runs `terraform fmt` and `terraform validate` to ensure code consistency and syntax correctness.
2. **Plan**: Generates and reports a Terraform execution plan, allowing you to review infrastructure changes.
3. **Apply**: Applies the changes based on the reviewed plan (manual trigger).
4. **Destroy**: Manually trigger the destruction of infrastructure in a given environment.

### How to Use CI/CD:
- Make sure your changes are committed and pushed to the appropriate GitLab branch (e.g., `dev`).
- GitLab CI/CD will automatically run the `plan` stage for the `dev` environment.
- To apply changes, manually trigger the `apply` job in GitLab's UI.
- To destroy resources, manually trigger the `destroy` job.

## Usage
1. Initialize and apply the configuration for your environment:
   ```bash
   terraform init
   terraform apply -var-file="vars/variables.dev.tfvars"
   ```

By combining Terraform's robust infrastructure as code capabilities with GitLab CI/CD automation, this setup ensures that infrastructure deployments are reproducible, traceable, and easy to manage across different environments.
