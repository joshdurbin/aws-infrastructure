module "canary" {
  source                       = "github.com/joshdurbin/terraform-aws-canary-security-sensor-capture-rest-api"
  kms_arn                      = "arn:aws:kms:${var.default_aws_region}:${data.aws_caller_identity.current_identify.account_id}:key/ecc9a0f4-8a2c-4eac-a58c-64193842113e"
  canary_username              = "${var.canary_username}"
  canary_encrytped_password    = "${var.canary_encrypted_password}"
  number_of_generated_api_keys = 1
}

module "net_stat_tracker" {
  source                       = "github.com/joshdurbin/terraform-network-status-monitor-storage-and-api"
  number_of_generated_api_keys = 0
}
