
variable "region" {
    default = "eu-central-1"
    type    = string
}

variable "instance_type" {
    type    = string
    default = "t2.micro"
}

variable "allow_ports" {
    description = "List of ports to open for server"
    type        = list
    default     = ["80", "443", "22"]
}


variable "enable_detailed_monitoring" {
    type    = bool
    default = "true"
}

variable "common_tags" {
    description = "Common tags for all resourses"
    type        = map
    default = {
        Name    = "Server"
        Owner   = "Vlad Kamlov"
        Project = "Test"
    }
}