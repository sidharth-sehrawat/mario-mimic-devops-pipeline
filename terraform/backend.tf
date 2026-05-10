terraform {
  backend "gcs" {
    bucket  = "super-mario-tf-state-sid2001"
    prefix  = "terraform/state"
  }
}
