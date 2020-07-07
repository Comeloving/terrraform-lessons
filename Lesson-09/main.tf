// AWS Data Sources

provider "aws" {}

data "aws_availability_zones" "working" {}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}


data "aws_vpcs" "aws_my_vpcs" {}


data "aws_vpc" "prod_vpc" {
    tags = {
        Name = "Prod"
    }
}



resource "aws_subnet" "prod_subnet_1" {
    vpc_id = "${data.aws_vpc.prod_vpc.id}"
    availability_zone = "${data.aws_availability_zones.working.names[0]}"
    cidr_block = "10.10.1.0/24"
    tags = {
        Name = "Subnet-1 in ${data.aws_availability_zones.working.names[0]}"
        Account = "Subnet in ${data.aws_caller_identity.current.account_id}"
        Region = "${data.aws_region.current.name}"
    }
}



output "data_aws_availability_zones" {
    value = data.aws_availability_zones.working.names
}

output "data_aws_caller" {
    value = "${data.aws_caller_identity.current.account_id}"
}

output "data_aws_region" {
    value = "${data.aws_region.current.name}"

}


output "aws_my_vpcs" {
    value = "${data.aws_vpcs.aws_my_vpcs.ids}"
}


output "prod_vpc_id" {
    value = "${data.aws_vpc.prod_vpc.id}"
}

output "prod_vpc_cidr" {
    value = "${data.aws_vpc.prod_vpc.cidr_block}"
}