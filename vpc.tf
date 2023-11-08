resource "aws_vpc" "tf-ecomm-vpc" {
  cidr_block       = "192.62.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "ecomm-vpc"
  }
}
