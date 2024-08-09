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

