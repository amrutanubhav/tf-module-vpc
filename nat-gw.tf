#provisions an elastic Ip needed for nat gateway
resource "aws_eip" "ngw-aws_eip" {
  vpc      = true
  tags = {
    Name = "robot-${var.ENV}-ngw-elastic-ip"
  }
}
#creates a NAT gateway
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw-aws_eip.id
  subnet_id     = aws_subnet.public-subnet.*.id[0]

  tags = {
    Name = "robot-${var.ENV}-ngw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}