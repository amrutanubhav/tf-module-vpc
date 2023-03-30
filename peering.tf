
#creates peering between robot vpc and default vpc

resource "aws_vpc_peering_connection" "peering" {
  peer_vpc_id   = aws_vpc.main.id
  vpc_id        = var.DEFAULT_VPC_ID
  auto_accept   = true  #valid if both vpc are in same acc

  tags = {
    Name = "robot-${var.ENV}-default.vpc.peering"
  }

}