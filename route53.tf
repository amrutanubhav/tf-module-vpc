# By default DNS Translation fo Private Hosted Zone only works with default VPC
# To make Private DNS Translations to work on a vpc-x, you need to associate the zone with vpc-x
resource "aws_route53_zone_association" "secondary" {
  zone_id = var.PRIVATE_HOSTEDZONE_ID
  vpc_id  = aws_vpc.main.id
}