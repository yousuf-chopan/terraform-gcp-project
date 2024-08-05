# main.tf

resource "google_compute_network" "my_vpc" {
  name                    = "my-vpc-network"
  auto_create_subnetworks = false # Disable automatic subnetwork creation
}
