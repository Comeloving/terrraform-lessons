// Introduce to Terraform

provider "aws" {
    region     = "eu-central-1"
}

resource "aws_instance" "my_amazon_linux_VM" {
    ami = "ami-0a02ee601d742e89f"
    instance_type = "t2.micro"

    tags = {
        Name    = "My_Amazon"
        Owner   = "Vlad"
        Project = "Test"
    }
}