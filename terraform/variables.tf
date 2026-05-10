variable  "project_id"  {
  description = "GCP Project ID"
  type  = string
}

variable  "region"  {
  description = "GCP region"
  type  = string
  default = "asia-south1"
}

variable  "zone"  {
  description = "GCP ZONE"
  type  = string
  default = "asia-south1-a"
}

variable  "cluster_name"  {
  description = "GKE cluster name"
  type  = string
  default = "super-mario-gke"
}
