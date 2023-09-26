output "vpc_id" {
  value = aws_vpc.vpc.vpc_id
}

output "public_subnets" {
  value       = aws_subnet.public_sbns[*].id
}

output "private_subnets" {
  value       = aws_subnet.private_sbns[*].id
}