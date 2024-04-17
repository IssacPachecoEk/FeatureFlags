variable "api_gateway_name" {
  description = "el nombre del api gateway"
  type        = string
  default     = "feature-flag-products"
  nullable    = false
}
variable "api_gatewat_description" {
  description = "descripción del api gateway"
  type        = string
  default     = "Este es el api gateway para la prueba de feature flags"
  nullable    = false
}
variable "stage_name" {
  description = "el stage del api gateway"
  type        = string
  default     = "qa"
  nullable    = false
}
variable "lambda_integration_arn" {
  description = "el arn de la lambda para api gateway"
  type        = string
  default     = ""
  nullable    = false
}
variable "log_group_arn" {
  description = "el arn del grupo de logs de la lambda"
  type        = string
  default     = ""
  nullable    = false
}
variable "http_method" {
  description = "el tipo de metodo del path api gateway"
  type        = string
  default     = "GET"
  nullable    = false
}
variable "root_route_path" {
  description = "la ruta del api gateway"
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