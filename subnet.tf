# Creates public subnets based on the number of CIDR Supplied in the variable
resource "aws_subnet" "public-subnet" { 
  count                   = length(var.PUBLIC_SUBNET_CIDR)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.PUBLIC_SUBNET_CIDR, count.index)
  availability_zone       = element(var.AZ, count.index)
  map_public_ip_on_launch = true       # gives public ip address to machines launched in this network

  tags = {
    Name = "robot-public-subnet-${element(var.AZ, count.index)}"
  }
}

# Count & Element are complementing functions; Count tells the number of times the loop has to run & element tells the item to picked from that iteration.

# Creates private subnets based on the number of CIDR Supplied in the variable
resource "aws_subnet" "private-subnet" { 
  count             = length(var.PRIVATE_SUBNET_CIDR)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.PRIVATE_SUBNET_CIDR, count.index)
  availability_zone = element(var.AZ, count.index)

  tags = {
    Name = "robot-private-subnet-${element(var.AZ, count.index)}"
  }
}