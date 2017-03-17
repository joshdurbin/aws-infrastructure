resource "aws_route53_zone" "joshdurbinnet" {

  name = "joshdurbin.net"

  tags {

    managed-by-terraform = true
  }
}

resource "aws_route53_record" "joshdurbin-net-vpn" {

  name = "vpn"
  zone_id = "${aws_route53_zone.joshdurbinnet.id}"
  type = "A"
  ttl = "60"
  records = ["73.92.243.251"]
}

resource "aws_route53_record" "joshdurbin-net-root" {

  name = ""
  zone_id = "${aws_route53_zone.joshdurbinnet.id}"
  type = "A"

  alias {

    name = "${aws_s3_bucket.joshdurbin-net.website_domain}"
    zone_id = "${aws_s3_bucket.joshdurbin-net.hosted_zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "joshdurbin-net-www" {

  name = "www"
  zone_id = "${aws_route53_zone.joshdurbinnet.id}"
  type = "CNAME"
  ttl = "60"
  records = ["${aws_route53_record.joshdurbin-net-root.fqdn}"]
}