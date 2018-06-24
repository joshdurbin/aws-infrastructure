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

resource "aws_route53_record" "apps_joshdurbin_net" {
  name    = "apps"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type    = "A"

  alias {
    name                   = "${aws_api_gateway_domain_name.apps_joshdurbin.cloudfront_domain_name}"
    zone_id                = "${aws_api_gateway_domain_name.apps_joshdurbin.cloudfront_zone_id}"
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


resource "aws_route53_record" "g_suite_spf" {
  name    = ""
  type    = "TXT"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.zone_id}"
  ttl     = "${var.global_ttl}"

  records = [
    "v=spf1 include:_spf.google.com ~all",
  ]
}

resource "aws_route53_record" "g_suite_dkim" {
  name    = "google._domainkey"
  type    = "TXT"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.zone_id}"
  ttl     = "${var.global_ttl}"

  records = [
    "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuhEjsqG07ljLzjY0i/T7AXyX6n+s2x+Ef90gZEIcQqkZWMHGtcya\" \"gMBo4JB0kcDOoPzclpA6sHEZzOakDcRuI8MraRywrUF+bu8gSCz9lPAwN4mjF5Xm/ZIHMAxeHPyaTqaRJOTZpm2TX9eKvgf82BoKuJlFEHe2Jf8t5\" \"7qPAeVt/EbccPalNqrVe5WxRYcKgseT2BP3wdumJ6xXVuS1i/T3rEDDBj37P8GqKTfkp5NQITtXwW4IQwtUEyuXnh42LlstyYxsP6D95SBypTwPkC\" \"T70CUZ71H7xJ9Rd6zMLi6O/RKVL2pCvpR9PwLbVXr8oB1d5M40tS76yXDvQgblowIDAQAB",
  ]
}

resource "aws_route53_record" "g_suite_mail_cname" {
  name    = "mail"
  type    = "CNAME"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.zone_id}"
  ttl     = "${var.global_ttl}"

  records = [
    "ghs.googlehosted.com",
  ]
}

resource "aws_route53_record" "g_suite_drive_cname" {
  name    = "drive"
  type    = "CNAME"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.zone_id}"
  ttl     = "${var.global_ttl}"

  records = [
    "ghs.googlehosted.com",
  ]
}

resource "aws_route53_record" "g_suite_calendar_cname" {
  name    = "calendar"
  type    = "CNAME"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.zone_id}"
  ttl     = "${var.global_ttl}"

  records = [
    "ghs.googlehosted.com",
  ]
}

resource "aws_route53_record" "g_suite_sites_cname" {
  name    = "sites"
  type    = "CNAME"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.zone_id}"
  ttl     = "${var.global_ttl}"

  records = [
    "ghs.googlehosted.com",
  ]
}

resource "aws_route53_record" "g_suite_groups_cname" {
  name    = "groups"
  type    = "CNAME"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.zone_id}"
  ttl     = "${var.global_ttl}"

  records = [
    "ghs.googlehosted.com",
  ]
}

resource "aws_route53_record" "g_suite_mx" {
  name    = ""
  type    = "MX"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.zone_id}"
  ttl     = "${var.global_ttl}"

  records = [
    "1 aspmx.l.google.com",
    "5 alt1.aspmx.l.google.com",
    "5 alt2.aspmx.l.google.com",
    "10 alt3.aspmx.l.google.com",
    "10 alt4.aspmx.l.google.com",
    "15 udqpaqboo4oyxjp27e5myhezdw6qfjrhf7ap7nmddfqighyz7vzq.mx-verification.google.com."
  ]
}