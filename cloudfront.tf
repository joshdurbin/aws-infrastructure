resource "aws_cloudfront_distribution" "www_joshdurbin_net" {

  origin {
    domain_name = "${aws_s3_bucket.www_joshdurbin_net.website_endpoint}"
    origin_id = "${aws_s3_bucket.www_joshdurbin_net.bucket}"

    custom_origin_config {

      origin_protocol_policy = "http-only"
      http_port = 80
      https_port = 443
      origin_ssl_protocols = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }

  enabled = true
  is_ipv6_enabled = true

  aliases = ["${var.www_joshdurbin_net}", "${var.joshdurbin_net}"]

  custom_error_response {

    error_code = 404
    response_page_path = "/404.html"
    response_code = 404
  }

  default_root_object = "index.html"

  default_cache_behavior {

    allowed_methods = ["GET", "HEAD"]
    cached_methods = ["GET", "HEAD"]

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    max_ttl = 60
    min_ttl = 0
    default_ttl = 60

    target_origin_id = "${aws_s3_bucket.www_joshdurbin_net.bucket}"
    viewer_protocol_policy = "redirect-to-https"
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags {
    managed-by-terraform = true
  }

  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-east-1:${data.aws_caller_identity.current_identify.account_id}:certificate/${var.www_joshdurbin_net_certificate_id}"
    ssl_support_method = "sni-only"
    minimum_protocol_version = "TLSv1"
  }
}