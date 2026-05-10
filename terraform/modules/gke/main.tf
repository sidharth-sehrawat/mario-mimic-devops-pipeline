resource "google_container_cluster" "gke" {
  name     = var.cluster_name
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.vpc_id
  subnetwork = var.subnet_id

  deletion_protection = false
}

resource "google_container_node_pool" "primary_nodes" {
  name     = "spot-node-pool"
  location = var.region
  cluster  = google_container_cluster.gke.name

  node_count = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 2
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {

    preemptible  = true
    machine_type = "e2-medium"

    disk_size_gb = 30
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      env = "dev"
    }

    tags = ["gke-node"]

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
