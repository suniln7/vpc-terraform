variable "aws_region" {
  type        = string
  description = "AWS region used to assing availability zones to vpc"
}

variable "eks_cluster_name" {
  type        = string
  description = "Name of the cluster to be created in group 1 subnet range"
}

variable "vpc_name" {
  type        = string
  description = "Name assigned to VPC"
}

variable "cidr_block" {
  type        = string
  description = "CIDR range to create a VPC"
}

variable "private_subnets_group_1" {
  type        = list(string)
  description = "list of private subnets cidr range"
}

variable "public_subnets_group_1" {
  type        = list(string)
  description = "list of public subnets cidr range"
}

variable "vpc_azs" {
  type        = list(string)
  description = "AZs for VPC subnet creation"
}

variable "vpc_nat_eip_allocation_id" {
  type = string
}
variable "env_name" {
  type = string
}

variable "map_public_ip_on_launch" {
  description = "Whether to assign a public IP to instances launched in the subnets"
  type        = bool
  default     = true
}