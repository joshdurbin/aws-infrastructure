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

resource "aws_route53_record" "migadu_mx" {
  name = ""
  type = "MX"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  ttl     = "60"
  records = ["10 aspmx1.migadu.com", "20 aspmx2.migadu.com"]
}

resource "aws_route53_record" "migadu_spif" {
  name    = ""
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type    = "TXT"
  ttl     = "60"

  records = ["v=spf1 a mx include:spf.migadu.com ~all"]
}

resource "aws_route53_record" "migadu_dkim" {
  name    = "default._domainkey.${var.joshdurbin_net}"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type    = "TXT"
  ttl     = "60"

  records = ["v=DKIM1; k=rsa; s=email; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC+msLJYUDmSWeokTDz8Za5LIM0Omh2XAH79EXny3yzpA7Jx7bSG37c35DWYUKr+NaMu8JtQCv/ZMWeGpPD8lmtYe8pKH8cJnwUbOhIBxbBYPXFhAFzBOW1GSwFLj0icfX+7i0O6WGoC5BBG5NyLm4U1u63gwZdPpHf/E71gXMuYwIDAQAB"]
}

resource "aws_route53_record" "migadu_dmarc" {
  name    = "_dmarc.${var.joshdurbin_net}"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type    = "TXT"
  ttl     = "60"

  records = ["v=DMARC1; p=none; fo=1; rua=mailto:admin@joshdurbin.net"]
}


