resource "aws_route53_zone" "www_joshdurbin_net" {

  name = "joshdurbin.net"

  tags {

    managed-by-terraform = true
  }
}

resource "aws_route53_record" "vpn_joshdurbin_net" {

  name = "vpn"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type = "A"
  ttl = "60"
  records = ["73.92.243.251"]
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