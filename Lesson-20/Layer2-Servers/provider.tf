provider "aws" {
  region = "eu-central-1"
}


terraform {
  backend "s3" {
    bucket  = "vkamlov-for-terraform"
    key     = "dev/servers/terraform.tfstate"
    region  = "eu-central-1"
  }
}