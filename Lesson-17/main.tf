
provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "my_webserver1" {
    ami             =   data.aws_ami.latest_amazon_linux.id
    //instance_type   =   var.env == "prod" ? "t2.large" : "t2.micro"
    instance_type   =   var.env == "prod" ? var.ec2-size["prod"] : var.ec2-size["dev"]
    tags = {
        Name        =   "${var.env}-server"
        Owner       =   var.env == "prod" ? var.prod_owner : var.noprod_owner
    }
}

resource "aws_instance" "my_webserver2" {
    ami             =   data.aws_ami.latest_amazon_linux.id
    instance_type   =   "t2.micro"
    count           =   var.env == "dev" ? 1 : 0
    tags = {
        Name        =   "Bastion for dev server"
    }
}

resource "aws_instance" "my_webserver3" {
    ami             =   data.aws_ami.latest_amazon_linux.id
    instance_type   =   lookup(var.ec2-size, var.env)

    tags = {
        Name        =   "Bastion for staging server"
    }
}

resource "aws_security_group" "my_webserver" {
  name        = "Dynamic_security_group"

  dynamic "ingress" {
    for_each = lookup(var.allow_port_list, var.env)
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http/https/ssh"
  }

}