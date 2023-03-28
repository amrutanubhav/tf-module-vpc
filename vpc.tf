# This creates VPC ; VPC is a regional resource 

resource "aws_vpc" "main" {
  cidr_block            = var.VPC_CIDR
  enable_dns_hostnames  = true

    tags = {
        Name = "robot-${var.ENV}-vpc"
    }
}