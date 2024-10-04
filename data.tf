data "aws_eip" "vpc_nat_eip" {
  id = var.vpc_nat_eip_allocation_id
}