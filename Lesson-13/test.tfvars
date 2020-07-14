region                          =   "eu-central-1"
instance_type                   =   "t2.micro"
enable_detailed_monitoring      =   false
allow_ports                     =   ["80", "443", "22"]


common_tags =   {
        Name    = "Test_Server"
        Owner   = "Vlad Kamlov"
        Project = "Test"
}