# terraform.tfvars

vpc_name               = "my-own-vpc"
subnet_name            = "my-subnet"
subnet_ip_cidr_range   = "10.0.0.0/24"
region                 = "us-central1" # Or your desired region
zone                   = "us-central1-a" # Or your desired zone
instance_name          = "my-instance-test"
machine_type           = "f1-micro"  # Or your desired machine type
image                  = "debian-cloud/debian-11" # Or your desired image
