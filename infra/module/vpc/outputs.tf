output "vpc_id" {
    description = "VPC ID"
    value    = aws_vpc.vpc.id
}

output "private_subnet_ids" {
    description  = "list private subnet"
    value        = aws_subnet.private_subnet[*].id
}