
resource "aws_route53_record" "mail_joshdurbin_net" {

  name = "mail"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type = "A"
  ttl = "${var.global_ttl}"

  records = [
    "66.111.4.147",
    "66.111.4.148"
  ]
}

resource "aws_route53_record" "mx_record_joshdurbin_net" {

  name = "${var.joshdurbin_net}"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type = "MX"
  ttl = "${var.global_ttl}"
  records = [
    "10 in1-smtp.messagingengine.com",
    "20 in2-smtp.messagingengine.com"
  ]
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
  type = "CNAME"
  ttl = "${var.global_ttl}"

  records = ["fm1.${var.joshdurbin_net}.dkim.fmhosted.com"]
}

resource "aws_route53_record" "dkim2" {

  name = "fm2._domainkey"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type = "CNAME"
  ttl = "${var.global_ttl}"

  records = ["fm2.${var.joshdurbin_net}.dkim.fmhosted.com"]
}

resource "aws_route53_record" "dkim3" {

  name = "fm3._domainkey"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  type = "CNAME"
  ttl = "${var.global_ttl}"

  records = ["fm3.${var.joshdurbin_net}.dkim.fmhosted.com"]
}

resource "aws_route53_record" "client_email_auto_discovery_submission" {

  name = "_submission._tcp"
  type = "SRV"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  ttl = "${var.global_ttl}"

  records = ["0 1 587 smtp.fastmail.com"]
}

resource "aws_route53_record" "client_email_auto_discovery_imap" {

  name = "_imap._tcp"
  type = "SRV"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  ttl = "${var.global_ttl}"

  records = ["0 0 0 ."]
}

resource "aws_route53_record" "client_email_auto_discovery_imaps" {

  name = "_imaps._tcp"
  type = "SRV"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  ttl = "${var.global_ttl}"

  records = ["0 1 993 imap.fastmail.com"]
}

resource "aws_route53_record" "client_email_auto_discovery_pop3" {

  name = "_pop3._tcp"
  type = "SRV"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  ttl = "${var.global_ttl}"

  records = ["0 0 0 ."]
}

resource "aws_route53_record" "client_email_auto_discovery_pop3s" {

  name = "_pop3s._tcp"
  type = "SRV"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  ttl = "${var.global_ttl}"

  records = ["10 1 995 pop.fastmail.com"]
}

resource "aws_route53_record" "client_carddav_auto_discovery_carddav" {

  name = "_carddav._tcp"
  type = "SRV"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  ttl = "${var.global_ttl}"

  records = ["0 0 0 ."]
}

resource "aws_route53_record" "client_carddav_auto_discovery_carddavs" {

  name = "_carddavs._tcp"
  type = "SRV"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  ttl = "${var.global_ttl}"

  records = ["0 1 443 carddav.fastmail.com"]
}

resource "aws_route53_record" "client_caldav_auto_discovery_caldav" {

  name = "_caldav._tcp"
  type = "SRV"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  ttl = "${var.global_ttl}"

  records = ["0 0 0 . "]
}

resource "aws_route53_record" "client_caldav_auto_discovery_caldavs" {

  name = "_caldavs._tcp"
  type = "SRV"
  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
  ttl = "${var.global_ttl}"

  records = ["0 1 443 caldav.fastmail.com"]
}