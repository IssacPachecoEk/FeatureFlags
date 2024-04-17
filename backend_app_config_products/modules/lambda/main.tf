resource "aws_lambda_function" "template_lambda" {
  function_name = var.name_lambda
  filename      = var.dir_files_zip
  runtime       = var.runtime_lambda
  handler       = var.handler_lambda
  timeout       = var.timeout_lambda
  layers        = [var.arn_layer_lambda]
  role          = var.role_lambda
  memory_size   = var.memory_size_lambda
  ephemeral_storage {
    size = var.ephemeral_storage_lambda
  }
  logging_config {
    log_format       = "JSON"
    system_log_level = "INFO"
  }
  environment {
    #Aquí puedes indicar las variables de entorno de la lambda
    variables = {
      APPCONFIG_APPLICATION   = var.appconfig_application
      APPCONFIG_ENVIRONMENT   = var.appconfig_environment
      APPCONFIG_CONFIGURATION = var.appconfig_configuration
      PRODUCT_TABLE           = var.name_table
    }
  }
  tags       = var.common_tag
  depends_on = [aws_cloudwatch_log_group.lambda_log]
}

resource "aws_cloudwatch_log_group" "lambda_log" {
  name = "/aws/lambda/${var.name_lambda}"
}

output "output_log_group_arn" {
  value       = aws_cloudwatch_log_group.lambda_log.arn
  sensitive   = true
  description = "retorna el arn del grupo de logs para la lambda"
  depends_on  = [aws_lambda_function.template_lambda]
}

output "output_lambda_function_arn" {
  value       = aws_lambda_function.template_lambda.arn
  sensitive   = true
  description = "retorna el arn de la función lambda"
  depends_on  = [aws_lambda_function.template_lambda]
}