terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.43.0"
    }
  }
  required_version = "~>1.7.5"
}
provider "aws" {
  region = local.region["virginia"]
  alias  = "virginia"
  default_tags {
    tags = local.common_tag
  }
}
module "iam" {
  source                  = "./modules/iam"
  name_role_lambda        = var.name_role_lambda
  name_policy_appconfig   = var.name_policy_appconfig
  appconfig_application   = var.appconfig_application_feature_flag
  appconfig_environment   = var.appconfig_environment_feature_flag
  appconfig_configuration = var.appconfig_configuration_feature_flag
  common_tag              = local.common_tag
}
module "dynamodb" {
  source        = "./modules/dynamodb"
  name_dynamodb = var.name_dynamodb
  items         = var.items
  common_tag    = local.common_tag
}
module "lambda" {
  source                   = "./modules/lambda"
  name_lambda              = var.name_lambda
  dir_files_zip            = var.dir_files_zip
  runtime_lambda           = var.runtime_lambda
  handler_lambda           = var.handler_lambda
  timeout_lambda           = var.timeout_lambda
  arn_layer_lambda         = var.arn_layer_lambda
  role_lambda              = module.iam.output_arn_role_lambda
  memory_size_lambda       = var.memory_size_lambda
  ephemeral_storage_lambda = var.ephemeral_storage_lambda
  appconfig_application    = var.appconfig_application_feature_flag
  appconfig_environment    = var.appconfig_environment_feature_flag
  appconfig_configuration  = var.appconfig_configuration_feature_flag
  name_table               = var.name_dynamodb
  common_tag               = local.common_tag
}
module "apigateway" {
  source = "./modules/apigateway"
  lambda_integration_arn  = module.lambda.output_lambda_function_arn
  log_group_arn           = module.lambda.output_log_group_arn
  api_gateway_name        = var.api_gateway_name
  api_gatewat_description = var.api_gatewat_description
  stage_name              = var.stage_name
  http_method             = var.http_method
  root_route_path         = var.root_route_path
  common_tag              = local.common_tag
  depends_on              = [module.lambda]
}