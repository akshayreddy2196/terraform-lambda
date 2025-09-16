
variable "function_name" {}
variable "image_uri" {}
variable "role_arn" {}

resource "aws_lambda_function" "this" {
  function_name = var.function_name
  package_type  = "Image"
  image_uri     = var.image_uri
  role          = var.role_arn
}
