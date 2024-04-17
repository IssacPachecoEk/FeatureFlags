locals {
  # este sirve para concatenar el nombre del project, environment y region
  project                 = "devops_prueba"
  environment             = "dev"
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
  items = [
    {
      id        = 1
      itemName  = "Product One"
      itemImage = "one.png"
      itemPrice = 10.99
      itemStock = 5
      itemDesc  = "Sed at sapien in turpis blandit tempor et a lacus."
    },
    {
      id        = 2
      itemName  = "Product Two"
      itemImage = "two.png"
      itemPrice = 19.50
      itemStock = 8
      itemDesc  = "Sed at sapien in turpis blandit tempor et a lacus."
    },
    {
      id        = 3
      itemName  = "Product Three"
      itemImage = "three.png"
      itemPrice = 32.00
      itemStock = 10
      itemDesc  = "Sed at sapien in turpis blandit tempor et a lacus."
    }
  ]
}