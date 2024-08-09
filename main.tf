# variables.tf 

variable "vpc_name" {
  type        = string
  description = "Name of the VPC network"
  default     = "my-vpc-network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
  default     = "my-subnet"
}

variable "subnet_ip_cidr_range" {
  type        = string
  description = "IP CIDR range for the subnet"
  default     = "10.0.0.0/24"
}

variable "region" {
  type        = string
  description = "Region for the subnet and GCE instance"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "Zone for the GCE instance"
  default     = "us-central1-a"
}

variable "instance_name" {
  type        = string
  description = "Name of the GCE instance"
  default     = "my-instance"
}

variable "machine_type" {
  type        = string
  description = "Machine type for the GCE instance"
  default     = "f1-micro"
}

variable "image" {
  type        = string
  description = "Image for the GCE instance"
  default     = "debian-cloud/debian-11"
}

# main.tf

# 1. VPC creation
resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

# 2. Subnet creation
resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_ip_cidr_range
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

# 3. GCE instance creation
resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id
    access_config {}  # Optional: to assign a public IP
  }
}
