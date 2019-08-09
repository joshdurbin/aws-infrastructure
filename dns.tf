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

module "gsuite_records" {
  source                        = "github.com/joshdurbin/gsuite_route53_terraform_module"
  route53_zone_name             = "${aws_route53_zone.www_joshdurbin_net.name}"
  record_ttl                    = "${var.global_ttl}"
  g_suite_site_verification_key = "google-site-verification=IVBofz_q6drXG2hGZVOAPHbXbVy35cWZn0XyBrVIsxU"
  g_suite_mail_dkim             = ["10 ALT4.ASPMX.L.GOOGLE.COM"]
}

//
//resource "aws_route53_record" "migadu_mx" {
//  name    = ""
//  type    = "MX"
//  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
//  ttl     = "${var.global_ttl}"
//  records = ["10 aspmx1.migadu.com", "20 aspmx2.migadu.com"]
//}
//
//resource "aws_route53_record" "migadu_spif" {
//  name    = ""
//  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
//  type    = "TXT"
//  ttl     = "${var.global_ttl}"
//
//  records = ["v=spf1 a mx include:spf.migadu.com ~all"]
//}
//
//resource "aws_route53_record" "migadu_dkim" {
//  name    = "default._domainkey.${var.joshdurbin_net}"
//  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
//  type    = "TXT"
//  ttl     = "${var.global_ttl}"
//
//  records = ["v=DKIM1; k=rsa; s=email; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDCvXlSt4NObUEhoJTCGWc+haDCpm0DcKABQgvQn/V5dAsRcKVaE9vH+449Tr1Bf2TLAhklVDMyzHd26TCIaQhkSre78zViOUFcgc/aOvc34MGChcfy8nNZp31PLb/zKQRzfQI0oWQRmdhnKwD4Em8uMP5QdakH3Vhm6lxgGVvIUQIDAQAB"]
//}
//
//resource "aws_route53_record" "migadu_dmarc" {
//  name    = "_dmarc.${var.joshdurbin_net}"
//  zone_id = "${aws_route53_zone.www_joshdurbin_net.id}"
//  type    = "TXT"
//  ttl     = "${var.global_ttl}"
//
//  records = ["v=DMARC1; p=none; fo=1; rua=mailto:admin@joshdurbin.net"]
//}