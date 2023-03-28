resource "aws_subnet" "public-subnet" {
  count      = length(var.PUBLIC_SUBNET_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.PUBLIC_SUBNET_CIDR,count.index)
  availability_zone = element(var.AZ,count.index
  tags = {
    Name = "robot-public-subnet-${element(var.AZ,count.index)}"
  }
}

resource "aws_subnet" "private-subnet" {
  count      = length(var.PRIVATE_SUBNET_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.PRIVATE_SUBNET_CIDR,count.index)
  availability_zone = element(var.AZ,count.index
  tags = {
    Name = "robot-private-subnet-${element(var.AZ,count.index)}"
  }
}