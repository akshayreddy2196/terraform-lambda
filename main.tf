
module "ecr" {
  source           = "./modules/ecr"
  repository_name  = "hello-lambda"
}

module "iam" {
  source     = "./modules/iam"
  role_name  = "lambda-execution-role"
}

module "lambda" {
  source        = "./modules/lambda"
  function_name = "hello-lambda"
  image_uri     = "var.repository_name"
  role_arn      = var.role_arn
}

module "apigateway" {
  source     = "./modules/apigateway"
  api_name   = "hello-api"
  lambda_arn = var.lambda_arn
}
