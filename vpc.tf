resource "aws_vpc" "tf-ecomm-vpc" {
  cidr_block       = "192.62.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "ecomm-vpc"
  }
}

resource "aws_subnet" "tf-ecomm-pub-sub-A" {
  vpc_id     = aws_vpc.tf-ecomm-vpc.id
  cidr_block = "192.62.0.0/24"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "ecomm-public-sub-A"  
  }
}

resource "aws_subnet" "tf-ecomm-pub-sub-B" {
  vpc_id     = aws_vpc.tf-ecomm-vpc.id
  cidr_block = "192.62.1.0/24"
  availability_zone = "us-east-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "ecomm-public-sub-B"
  }
}

resource "aws_subnet" "tf-ecomm-pvt-sub-A" {
  vpc_id     = aws_vpc.tf-ecomm-vpc.id
  cidr_block = "192.62.2.0/24"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = false
  tags = {
    Name = "ecomm-private-sub-A"
  }
}

resource "aws_subnet" "tf-ecomm-pvt-sub-B" {
  vpc_id     = aws_vpc.tf-ecomm-vpc.id
  cidr_block = "192.62.3.0/24"
  availability_zone = "us-east-2b"
  map_public_ip_on_launch = false
  tags = {
    Name = "ecomm-private-sub-B"
  }
}
