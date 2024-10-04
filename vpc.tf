locals {
  vpc_name     = var.vpc_name
  region       = var.aws_region
  cluster_name = var.eks_cluster_name
  tags = {
    terraform   = "true"
    Environment = var.env_name
  }

  this_route_table_ids = concat(module.vpc.private_route_table_ids, module.vpc.public_route_table_ids)


}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

  name                 = local.vpc_name
  cidr                 = var.cidr_block
  enable_dns_hostnames = true

  azs = var.vpc_azs

  private_subnets = var.private_subnets_group_1
  public_subnets  = var.public_subnets_group_1

  map_public_ip_on_launch = var.map_public_ip_on_launch

  manage_default_route_table = true
  default_route_table_tags = {
    Name = "${local.vpc_name}-default"
  }

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
  reuse_nat_ips          = true
  external_nat_ip_ids    = data.aws_eip.vpc_nat_eip.*.id


  enable_flow_log                      = true
  create_flow_log_cloudwatch_log_group = true
  create_flow_log_cloudwatch_iam_role  = true
  flow_log_max_aggregation_interval    = 60

  public_subnet_suffix  = "public-group-1"
  private_subnet_suffix = "private-group-1"

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }

  tags = local.tags

}

