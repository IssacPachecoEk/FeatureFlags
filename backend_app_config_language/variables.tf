############ api gateway ############ 
variable "api_gateway_name" {
  description = "el nombre del api gateway"
  type        = string
  default     = "feature-flag-languages"
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
variable "http_method" {
  description = "el tipo de metodo del path api gateway"
  type        = string
  default     = "GET"
  nullable    = false
}
variable "root_route_path" {
  description = "la ruta del api gateway"
  type        = string
  default     = "languages"
  nullable    = false
}
############ iam ############ 
variable "name_role_lambda" {
  description = "el nombre del rol para la funcion lambda"
  type        = string
  default     = "iam-for-lambda-lenguages"
  nullable    = false
}
variable "name_policy_appconfig" {
  description = "el nombre de la politica del appconfig"
  type        = string
  default     = "policy-for-appconfig-lenguages"
  nullable    = false
}
variable "appconfig_application_feature_flag" {
  description = "el id de la aplicacion del appconfig"
  type        = string
  default     = ""
  sensitive   = true
  nullable    = false
}
variable "appconfig_environment_feature_flag" {
  description = "el id del ambiente del appconfig"
  type        = string
  default     = ""
  sensitive   = true
  nullable    = false
}
variable "appconfig_configuration_feature_flag" {
  description = "el id del perfil para el appconfig"
  type        = string
  default     = ""
  sensitive   = true
  nullable    = false
}
############ lambda ############ 
variable "name_lambda" {
  description = "el nombre de la funcion lambda"
  type        = string
  default     = "feature-flag-languages"
  nullable    = false
}
variable "dir_files_zip" {
  description = "la dirección del comprimido zip de los archivos a subir"
  type        = string
  default     = "./backend_app_config_language.zip"
  nullable    = false
}
variable "runtime_lambda" {
  description = "el runtime de la funcion lambda"
  type        = string
  default     = "nodejs20.x"
  nullable    = false
}
variable "handler_lambda" {
  description = "el handler de la funcion lambda"
  type        = string
  default     = "handler.myLanguages"
  nullable    = false
}
variable "timeout_lambda" {
  description = "el tiempo de vida del la lambda"
  type        = number
  default     = 60
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