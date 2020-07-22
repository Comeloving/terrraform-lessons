provider "aws" {
  region = "eu-central-1"
}


module "vpc-default" {
  source = "../modules/aws_network"
}

/*
module "vpc-dev" {
  source = "../modules/aws_network"
  env                  = "dev"
  vpc_cidr             = "10.100.0.0/16"
  public_subnets_cidrs  = ["10.100.1.0/24", "10.100.2.0/24"]
  private_subnets_cidrs = []
}

module "vpc-prod" {
  source = "../modules/aws_network"
  env                  = "prod"
  vpc_cidr             = "10.10.0.0/16"
  public_subnets_cidrs  = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  private_subnets_cidrs = ["10.10.11.0/24", "10.10.22.0/24", "10.10.33.0/24"]
}

module "vpc-test" {
  source = "../modules/aws_network"
  env                  = "staging"
  vpc_cidr             = "10.10.0.0/16"
  public_subnets_cidrs  = ["10.10.1.0/24", "10.10.2.0/24"]
  private_subnets_cidrs = ["10.10.11.0/24", "10.10.22.0/24"]
}

*/