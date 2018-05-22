resource "aws_route53_zone" "www_joshdurbin_net" {

  name = "joshdurbin.net"

  tags {

    managed-by-terraform = true
  }
}

resource "aws_route53_record" "joshdurbin_net" {

  name = ""
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type = "A"

  alias {

    name = "${aws_cloudfront_distribution.www_joshdurbin_net.domain_name}"
    zone_id = "${aws_cloudfront_distribution.www_joshdurbin_net.hosted_zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www_joshdurbin_net" {

  name = "www"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type = "A"

  alias {

    name = "${aws_cloudfront_distribution.www_joshdurbin_net.domain_name}"
    zone_id = "${aws_cloudfront_distribution.www_joshdurbin_net.hosted_zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "apps_joshdurbin_net" {

  name = "apps"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type = "A"

  alias {

    name = "${aws_api_gateway_domain_name.apps_joshdurbin.cloudfront_domain_name}"
    zone_id = "${aws_api_gateway_domain_name.apps_joshdurbin.cloudfront_zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "keybase_verification_joshdurbin_net" {

  name = "_keybase"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type = "TXT"
  ttl = "${var.global_ttl}"

  records = ["keybase-site-verification=3Xua_2l2_vi5onXlYIYi5WPnb_wL-vi5dqs010jZR7o"]
}

resource "aws_route53_record" "gsuite_proof" {

  name = "15814602"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type = "CNAME"
  ttl = "${var.global_ttl}"

  records = [
    "google.com"
  ]
}

module "example_fastmail" {
  source = "github.com/bluk/terraform-aws-fastmail-dns"

  domain_name = "${var.joshdurbin_net}"
  route53_zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
}