variable "name_dynamodb" {
  description = "el nombre de la tabla"
  type        = string
  default     = "products"
  nullable    = false
}
variable "common_tag" {
  description = "etiquetas generales del despliegue"
  nullable    = false
  type = object({
    project     = string
    environment = string
    version     = string
  })
  default = {
    project     = "devops_prueba"
    environment = "dev"
    version     = "1.0.0"
  }
}
variable "items" {
  description = "items para la tabla de productos"
  nullable    = false
  type = list(object({
    id        = number
    itemName  = string
    itemImage = string
    itemPrice = number
    itemStock = number
    itemDesc  = string
  }))
  default = [
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