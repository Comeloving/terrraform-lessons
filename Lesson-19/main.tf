
resource "aws_instance" "my_default_server1" {
    ami             =   data.aws_ami.latest_amazon_linux.id
    instance_type   =   "t2.micro"
    tags = {
        Name        =   "Default Server"
    }
}

resource "aws_instance" "my_default_server2" {
    provider        =   aws.Ireland
    ami             =   data.aws_ami.latest_amazon_linux_eu-west-1.id
    instance_type   =   "t2.micro"
    tags = {
        Name        =   "Default Server"
    }
}

resource "aws_instance" "my_default_server3" {
    provider        =   aws.London
    ami             =   data.aws_ami.latest_amazon_linux_eu-west-2.id
    instance_type   =   "t2.micro"
    tags = {
        Name        =   "Default Server"
    }
}