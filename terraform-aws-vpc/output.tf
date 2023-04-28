output "vpcid" {
  value = aws_vpc.production-vpc.id
}
output "public-subnet" {
  value = aws_subnet.public-subnet.id
}
