# main.tf

# 1. Define the VPC (Virtual Private Cloud) Network
resource "google_compute_network" "my_vpc" {
  name                    = "my-vpc-network"  # Choose a descriptive name
  auto_create_subnetworks = false
}

# 2. Create a Subnet within the VPC
resource "google_compute_subnetwork" "my_subnet" {
  name          = "my-subnet"
  ip_cidr_range = "10.0.0.0/24"  # Adjust the CIDR range as needed
  region        = "us-central1"  # Replace with your desired region
  network       = google_compute_network.my_vpc.id
}

# 3. Define the GCE (Google Compute Engine) Instance
resource "google_compute_instance" "my_instance" {
  name         = "my-instance"
  machine_type = "f1-micro"  # Choose an appropriate machine type
  zone         = "us-central1-a"  # Replace with your desired zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"  # Or your preferred image
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.my_subnet.id
    access_config {  # Optional: If you need a public IP
      # network_tier = "PREMIUM"  # Uncomment if needed
    }
  }
}

# 4. Create a Firewall Rule to allow traffic on port 8080
resource "google_compute_firewall" "allow_http" {
  name          = "allow-http"
  network       = google_compute_network.my_vpc.id

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["0.0.0.0/0"]  # Allow from anywhere (adjust if needed)
  target_tags   = ["http-server"]  # Apply this rule to instances with this tag
}
