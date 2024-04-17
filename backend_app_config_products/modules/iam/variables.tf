variable "name_role_lambda" {
  description = "el nombre del rol para la funcion lambda"
  type        = string
  default     = "iam-for-lambda-products"
  nullable    = false
}
variable "name_policy_appconfig" {
  description = "el nombre de la politica del appconfig"
  type        = string
  default     = "policy-for-appconfig-products"
  nullable    = false
}
variable "appconfig_application" {
  description = "el id de la aplicacion del appconfig"
  type        = string
  default     = ""
  sensitive   = true
  nullable    = false
}
variable "appconfig_environment" {
  description = "el id del ambiente del appconfig"
  type        = string
  default     = ""
  sensitive   = true
  nullable    = false
}
variable "appconfig_configuration" {
  description = "el id del perfil para el appconfig"
  type        = string
  default     = ""
  sensitive   = true
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