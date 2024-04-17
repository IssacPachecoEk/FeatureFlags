resource "aws_apigatewayv2_api" "main" {
  name          = "api-${var.api_gateway_name}"
  description   = var.api_gatewat_description
  protocol_type = "HTTP"
  tags          = var.common_tag
}
resource "aws_apigatewayv2_stage" "sample_stage_resource" {
  api_id      = aws_apigatewayv2_api.main.id
  name        = var.stage_name
  auto_deploy = true
  access_log_settings {
    destination_arn = var.log_group_arn

    format = jsonencode({
      requestId               = "$context.requestId"
      sourceIp                = "$context.identity.sourceIp"
      requestTime             = "$context.requestTime"
      protocol                = "$context.protocol"
      httpMethod              = "$context.httpMethod"
      resourcePath            = "$context.resourcePath"
      routeKey                = "$context.routeKey"
      status                  = "$context.status"
      responseLength          = "$context.responseLength"
      integrationErrorMessage = "$context.integrationErrorMessage"
      }
    )
  }
}

resource "aws_apigatewayv2_integration" "sample_integration_resource" {
  api_id                 = aws_apigatewayv2_api.main.id
  integration_type       = "AWS_PROXY" # para integrar la solicitud de ruta o método con una función Lambda u otra acción de servicio de AWS
  connection_type        = "INTERNET"  #Especifique INTERNET conexiones a través de Internet pública enrutable
  integration_method     = var.http_method
  integration_uri        = var.lambda_integration_arn #data.aws_lambda_function.sample_lambda_resource.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "sample_route_resource" {
  api_id             = aws_apigatewayv2_api.main.id
  route_key          = "${var.http_method} /${var.root_route_path}"
  authorization_type = "NONE"
  target             = "integrations/${aws_apigatewayv2_integration.sample_integration_resource.id}"
}

resource "aws_lambda_permission" "api_gw" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.api_gateway_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_apigatewayv2_api.main.execution_arn}/*/*"
}