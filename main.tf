provider "aws" {
  region = "us-east-1" 
}

resource "aws_security_group" "securityGroupByTerraform" {
  name        = "terraform-security-group"
  description = "Example of security group created by Terraform"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 111
    to_port     = 111
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 111
    to_port     = 111
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

      ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_eip" "createdByTerraform" {
  instance = aws_instance.createdByTerraform.id
}

resource "aws_instance" "createdByTerraform" {
  ami           = "ami-0cf10cdf9fcd62d37" 
  instance_type = "t3.small"
  key_name      = "minhaNovaChave"
  ebs_optimized = true

  vpc_security_group_ids = [aws_security_group.securityGroupByTerraform.id]
  

  root_block_device {
    delete_on_termination = true
  }

  tags = {
    "Name"       = ""
    "CostCenter" = ""
    "Project"    = ""
  }

  volume_tags = {
    "Name"       = ""
    "CostCenter" = ""
    "Project"    = ""
  }

  metadata_options {
    http_tokens             = "required"
    http_endpoint           = "enabled"
    http_put_response_hop_limit = 2
  }
}

resource "aws_eip_association" "createdByTerraform" {
  instance_id   = aws_instance.createdByTerraform.id
  allocation_id = aws_eip.createdByTerraform.id
}