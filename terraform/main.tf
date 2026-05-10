module "vpc" {
  source = "./modules/vpc"

  region = var.region
}

module "gke" {
  source = "./modules/gke"

  cluster_name = var.cluster_name
  region       = var.region

  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.subnet_id
}

module "artifact_registry" {
  source = "./modules/artifact-registry"

  region = var.region
}
