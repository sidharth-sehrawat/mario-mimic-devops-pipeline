resource "google_artifact_registry_repository" "repo" {
  location      = var.region
  repository_id = "super-mario-repo"
  description   = "Docker repository"
  format        = "DOCKER"
}
