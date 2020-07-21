data "aws_ami" "latest_amazon_linux" {
    owners = ["amazon"]
    most_recent = true
    filter {
        name        =    "name"
        values      =    ["amzn2-ami-hvm-*-x86_64-gp2"]
    }

}

data "aws_ami" "latest_amazon_linux_eu-west-1" {
    provider        =   aws.Ireland
    owners = ["amazon"]
    most_recent = true
    filter {
        name        =    "name"
        values      =    ["amzn2-ami-hvm-*-x86_64-gp2"]
    }

}

data "aws_ami" "latest_amazon_linux_eu-west-2" {
    provider        =   aws.London
    owners = ["amazon"]
    most_recent = true
    filter {
        name        =    "name"
        values      =    ["amzn2-ami-hvm-*-x86_64-gp2"]
    }

}