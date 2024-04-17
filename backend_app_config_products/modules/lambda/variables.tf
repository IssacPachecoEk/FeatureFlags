variable "name_lambda" {
  description = "el nombre de la funcion lambda"
  type        = string
  default     = "feature-flag-products"
  nullable    = false
}
variable "dir_files_zip" {
  description = "la dirección del comprimido zip de los archivos a subir"
  type        = string
  default     = "./backend_app_config_products.zip"
  nullable    = false
}
variable "runtime_lambda" {
  description = "el runtime de la funcion lambda"
  type        = string
  default     = "nodejs16.x"
  nullable    = false
}
variable "handler_lambda" {
  description = "el handler de la funcion lambda"
  type        = string
  default     = "index.handler"
  nullable    = false
}
variable "timeout_lambda" {
  description = "el tiempo de vida del la lambda"
  type        = number
  default     = 60
  nullable    = false
}
variable "role_lambda" {
  description = "el ARN del rol de la lambda"
  type        = string
  default     = ""
  sensitive   = true
  nullable    = false
}
variable "arn_layer_lambda" {
  description = "el arn del layer para la lambda"
  type        = string
  default     = "arn:aws:lambda:us-east-1:027255383542:layer:AWS-AppConfig-Extension:61"
  sensitive   = true
  nullable    = false
}
variable "memory_size_lambda" {
  description = "el tamaño de la memoria para la lambda"
  type        = number
  default     = 128
  nullable    = false
}
variable "ephemeral_storage_lambda" {
  description = "el tamaño del almacenamiento efímero para la lambda"
  type        = number
  default     = 512
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
variable "name_table" {
  description = "el nombre de la tabla de dynamobd"
  type        = string
  default     = "products"
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