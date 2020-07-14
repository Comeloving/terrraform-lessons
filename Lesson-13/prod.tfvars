region                          =   "eu-central-1"
instance_type                   =   "t2.micro"
enable_detailed_monitoring      =   true
allow_ports                     =   ["80", "443"]


common_tags =   {
        Name    = "Prod_Server"
        Owner   = "Vlad Kamlov"
        Project = "Prod"
}