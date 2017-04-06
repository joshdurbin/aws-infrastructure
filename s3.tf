
data "aws_iam_policy_document" "www_joshdurbin_net" {

  statement {
    actions = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${var.www_joshdurbin_net}/*"]

    principals {
      type = "*"
      identifiers = ["*"]
    }
  }
}

resource "aws_s3_bucket" "www_joshdurbin_net" {

  bucket = "${var.www_joshdurbin_net}"
  acl = "private"

  website {

    error_document = "404.html"
    index_document = "index.html"
  }

  policy = "${data.aws_iam_policy_document.www_joshdurbin_net.json}"
}