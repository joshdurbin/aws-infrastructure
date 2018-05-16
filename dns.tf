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

//resource "aws_route53_record" "mail_joshdurbin_net" {
//
//  name = "mail"
//  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
//  type = "A"
//  ttl = "60"
//
//  records = ["${digitalocean_droplet.mail_server.ipv4_address}"]
//}

resource "aws_route53_record" "mx_record_joshdurbin_net" {

  name = "${var.joshdurbin_net}"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type = "MX"
  ttl = "${var.global_ttl}"
  records = ["10 in1-smtp.messagingengine.com", "20 in2-smtp.messagingengine.com"]
}

resource "aws_route53_record" "spf1" {

  name = ""
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type = "TXT"
  ttl = "${var.global_ttl}"

  records = ["v=spf1 include:spf.messagingengine.com ?all"]
}

resource "aws_route53_record" "dkim1" {

  name = "fm1._domainkey"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type = "TXT"
  ttl = "${var.global_ttl}"

  records = ["fm1.${var.joshdurbin_net}.dkim.fmhosted.com"]
}

resource "aws_route53_record" "dkim2" {

  name = "fm2._domainkey"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type = "TXT"
  ttl = "${var.global_ttl}"

  records = ["fm2.${var.joshdurbin_net}.dkim.fmhosted.com"]
}

resource "aws_route53_record" "dkim3" {

  name = "fm3._domainkey"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type = "TXT"
  ttl = "${var.global_ttl}"

  records = ["fm3.${var.joshdurbin_net}.dkim.fmhosted.com"]
}