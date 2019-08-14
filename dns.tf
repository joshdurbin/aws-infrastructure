resource "aws_route53_zone" "www_joshdurbin_net" {
  name = "joshdurbin.net"

  tags {
    managed-by-terraform = true
  }
}

resource "aws_route53_record" "joshdurbin_net" {
  name    = ""
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type    = "A"

  alias {
    name                   = "${aws_cloudfront_distribution.www_joshdurbin_net.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.www_joshdurbin_net.hosted_zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www_joshdurbin_net" {
  name    = "www"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type    = "A"

  alias {
    name                   = "${aws_cloudfront_distribution.www_joshdurbin_net.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.www_joshdurbin_net.hosted_zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "keybase_verification_joshdurbin_net" {
  name    = "_keybase"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type    = "TXT"
  ttl     = "${var.global_ttl}"

  records = ["keybase-site-verification=3Xua_2l2_vi5onXlYIYi5WPnb_wL-vi5dqs010jZR7o"]
}

module "fastmail_records" {
  source = "github.com/bluk/terraform-aws-fastmail-dns"
	
  domain_name = "joshdurbin.net"
  route53_zone_id = "${aws_route53_zone.www_joshdurbin_net.zone_id}"
}
