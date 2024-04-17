locals {
  # este sirve para concatenar el nombre del project, environment y region
  bucket_name = "${local.project}-${local.environment}-${local.region["virginia"]}"
  project     = "devops_prueba"
  environment = "dev"
  region = {
    "virginia" = "us-east-1",
    "ohio"     = "us-east-2"
  }
  alias = {
    "virginia" = "east-1",
    "ohio"     = "east-2"
  }
  version = "1.0.0"
  common_tag = {
    project     = local.project
    environment = local.environment
    version     = local.version
  }
}