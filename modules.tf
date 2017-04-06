
module "canary" {
  source = "github.com/joshdurbin/aws_canary_sensor_capture"
  kms_arn = "arn:aws:kms:${var.default_region}:${data.aws_caller_identity.current_identify.account_id}:key/ecc9a0f4-8a2c-4eac-a58c-64193842113e"
  canary_username = "${var.canary_username}"
  canary_encrytped_password = "${var.canary_encrypted_password}"
  number_of_generated_api_keys = 0
}

output "my_canary_api_keys" {
  value = "${module.canary.api_keys}"
}

output "my_canary_api_gateway_endpoint" {
  value = "${module.canary.api_gateway_endpoint}"
}