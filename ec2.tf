resource "aws_security_group" "tf-ecomm-pub-SG" {
  name        = "ecomm-SG"
  description = "Allow HTTP & SSH"
  vpc_id      = aws_vpc.tf-ecomm-vpc.id

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ecomm-Security"
  }
}



#Instance

resource "aws_instance" "ecomm-web" {
  ami                     = "ami-07b36ea9852e986ad"
  instance_type           = "t2.micro"
  subnet_id = aws_subnet.tf-ecomm-pub-sub-A.id
  key_name = "terraform"
  vpc_security_group_ids = [aws_security_group.tf-ecomm-pub-SG.id]
  user_data = file("webapp.sh")

  tags = {
  Name= "ecomm-server"
  }
}
