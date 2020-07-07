// LifeCycle and EIP

provider "aws" {
    region     = "eu-central-1"
}


resource "aws_eip" "my_static_ip" {
  instance = aws_instance.my_web_server.id
}

resource "aws_instance" "my_web_server" {
    ami                    = "ami-0a02ee601d742e89f"
    instance_type          = "t2.micro"
    vpc_security_group_ids = [aws_security_group.my_webserver.id]
    user_data              = templatefile("user_data.sh.tpl", {
      f_name = "Vlad",
      l_name = "Kamlov",
      names  = ["Vasya", "Kolya", "Petya", "Masha", "Katya"]
    })

  tags = {
    Name = "Web Server Build by Terraform"
    Owner = "Vlad"
  }

    lifecycle {
    create_before_destroy = true
  }
    
} 


resource "aws_security_group" "my_webserver" {
  name        = "My_security_group"
  description = "My first security group"

  ingress {
    description = "HTTP from World"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    description = "HTTPS from World"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http/https"
  }

}
