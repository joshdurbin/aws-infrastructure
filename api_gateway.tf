resource "aws_api_gateway_domain_name" "apps_joshdurbin" {
  domain_name = "apps.joshdurbin.net"
  certificate_arn = "arn:aws:acm:us-east-1:795557596088:certificate/a3b0cdf1-7745-4287-b1a0-b655eb618c0a"
}

resource "aws_api_gateway_base_path_mapping" "canary_data" {
  base_path = "canary_data"
  api_id = "${module.canary.api_id}"
  stage_name = "${module.canary.api_stage_name}"
  domain_name = "${aws_api_gateway_domain_name.apps_joshdurbin.domain_name}"
}