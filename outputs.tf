output "my_net_stat_tracker_api_keys" {
  value = "${module.net_stat_tracker.rest_api_keys}"
}

output "my_net_stat_tracker_canary_api_gateway_endpoint" {
  value = "${module.net_stat_tracker.api_gateway_endpoint}"
}

output "my_net_stat_tracker_app_access_key" {
  value = "${module.net_stat_tracker.direct_dynamodb_access_key}"
}

output "my_net_stat_tracker_app_secret_key" {
  value = "${module.net_stat_tracker.direct_dynamodb_secret_key}"
}

output "my_canary_api_keys" {
  value = "${module.canary.api_keys}"
}

output "my_canary_api_gateway_endpoint" {
  value = "${module.canary.api_gateway_endpoint}"
}
