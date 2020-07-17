
provider "aws" {
  region = "eu-central-1"
}

resource "null_resource" "command1" {
  provisioner "local-exec" {
    command = "echo Terraform START: $(date) >> log.txt"
  }
}



resource "null_resource" "command2" {
  provisioner "local-exec" {
    command = "echo $NAME1 $NAME2 $NAME3 >> names.txt"
    environment = {
      NAME1 = "Vasya"
      NAME2 = "Petya"
      NAME3 = "Kolya"
    }
  }
}


resource "aws_instance" "myserver" {
  ami           = "${data.aws_ami.latest_amazon_linux.id}"
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo Hello from AWS Instance Creations!"
  }
}


resource "null_resource" "command3" {
  provisioner "local-exec" {
    command = "echo Terraform END: $(date) >> log.txt"
  }
  depends_on = [null_resource.command1, null_resource.command2, aws_instance.myserver]
}


data "aws_ami" "latest_amazon_linux" {
    owners = ["amazon"]
    most_recent = true
    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}