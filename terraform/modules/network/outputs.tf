output "vpc_subnet_id" {
  value = aws_subnet.sn_vpc.id
}

output "vpc_security_group_id" {
  value = aws_security_group.sg_vpc.id
}