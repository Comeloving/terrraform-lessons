
provider "aws" {
  region = "eu-central-1"
}

resource "aws_iam_user" "user1" {
    name        =       "Pushkin"
}

resource "aws_iam_user" "users" {
    count       =       length(var.aws_users)
    name        =       element(var.aws_users, count.index)
}

resource "aws_instance" "server" {
    ami             =   data.aws_ami.latest_amazon_linux.id
    instance_type   =   "t2.micro"
    count           =   3
    tags = {
        Name        =   "Server Number ${count.index + 1}"
    }
}