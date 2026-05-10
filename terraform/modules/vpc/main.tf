resource  "google_compute_network"  "vpc" {
  name  = "super-mario-vpc"
  auto_create_subnetworks = false
}

resource  "google_compute_subnetwork" "subnet"  {
  name  = "super-mario-subnet"
  ip_cidr_range = "10.10.0.0/16"
  region  = var.region
  network = google_compute_network.vpc.id
}
