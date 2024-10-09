aws_region                       = "us-east-1"
env_name                         = "Dev"
eks_cluster_name                 = "dev-eks"

# VPC values
vpc_name   = "EKS-VPC"
cidr_block = "10.40.0.0/16"

private_subnets_group_1        = ["10.40.2.0/24", "10.40.1.0/24", "10.40.3.0/24", "10.40.13.0/24"]
public_subnets_group_1    = ["10.40.107.0/24", "10.40.108.0/24", "10.40.109.0/24"]

map_public_ip_on_launch = true
# first AZ in the list will be picked for NAT gateway creation. NAT gateway limit is 5 per AZ

vpc_azs                   = ["us-east-1b", "us-east-1a", "us-east-1c"]
vpc_nat_eip_allocation_id = "eipalloc-043d87893dd74ecca"
