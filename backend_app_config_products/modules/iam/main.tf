# obtiene la politica del rol de la lambda
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
# se define el rol de la lambda
resource "aws_iam_role" "iam_for_lambda" {
  name               = var.name_role_lambda
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags               = var.common_tag
}
# se define la política del appconfig para permitir la ejecución de función lambda
resource "aws_iam_policy" "appconfig_policy" {
  name        = var.name_policy_appconfig
  path        = "/"
  description = "Política para permitir la ejecución del appconfig"
  tags        = var.common_tag
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        {
          Action = [
            "appconfig:GetLatestConfiguration",
            "appconfig:StartConfigurationSession"
          ]
          Effect   = "Allow"
          Resource = "arn:aws:appconfig:*:*:application/${var.appconfig_application}/environment/${var.appconfig_environment}/configuration/${var.appconfig_configuration}"
        },
        {
          Action = [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents",
          ]
          Effect   = "Allow"
          Resource = "arn:aws:logs:*:*:*"
        },
        {
          Action = [
            "dynamodb:*"
          ]
          Effect   = "Allow"
          Resource = "*"
        }
      ]
  })
}
# se atacha el rol a la politica del codepipeline
resource "aws_iam_role_policy_attachment" "appconfig_role_attach" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.appconfig_policy.arn
}
output "output_arn_role_lambda" {
  value       = aws_iam_role.iam_for_lambda.arn
  sensitive   = true
  description = "retorna el arn del rol para la funcion lambda"
  depends_on  = [aws_iam_role.iam_for_lambda]
}

  