variable "env" {
    default = "dev"
}

variable "prod_owner" {
    default     =   "Vladislav Kamlov"
}

variable "noprod_owner" {
    default     =   "Levyi Chelik"
}

variable "ec2-size" {
    default = {
        "prod" = "t2.large"
        "test" = "t2.medium"
        "dev"  = "t2.micro"
    }
}

variable "allow_port_list" {
    default = {
        "prod"  =   ["80", "443"]
        "dev"   =   ["80", "8080", "443", "22"]
    }
}