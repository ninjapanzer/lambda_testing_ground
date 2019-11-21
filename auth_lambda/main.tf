####################
# Auth Lambda
####################
module "auth_lambda" {
  source             = "../modules/lambda"
  name               = "${var.project}-${var.lambda_name}-${var.stage_name}"
  handler            = "main"
  runtime            = "${var.lambda_runtime}"
  memory             = "${var.lambda_memory}"
  timeout            = "${var.lambda_timeout}"
  package            = "./auth_lambda/function.zip"
  tags               = "${var.lambda_tags}"
  security_group_ids = "${var.lambda_security_group_ids}"
  subnet_ids         = "${var.lambda_subnet_ids}"
  env = {
    lightspeed_client_id = "${var.lightspeed_client_id}"
    lightspeed_client_secret = "${var.lightspeed_client_secret}"
  }
}
