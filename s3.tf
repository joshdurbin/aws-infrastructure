resource "aws_s3_bucket" "joshdurbin-net" {

  bucket = "${var.joshdurbin-net-bucket}"
  acl = "private"

  website {

    index_document = "index.html"
    error_document = "404.html"
  }

  policy = <<EOF
{
  "Id": "Policy1489732695202",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1489732693030",
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${var.joshdurbin-net-bucket}/*",
      "Principal": "*"
    }
  ]
}
EOF
}