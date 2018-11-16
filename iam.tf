resource "aws_iam_access_key" "circle_ci_deploy_key" {
  user = "${aws_iam_user.circle_ci.name}"
}

resource "aws_iam_user" "circle_ci" {
  name = "circleci"
  path = "/system/"
}

resource "aws_iam_user_policy" "circle_ci_s3_access" {
  name = "s3_access"
  user = "${aws_iam_user.circle_ci.name}"

  policy = "${data.aws_iam_policy_document.circle_ci_s3_access_policy.json}"
}

data "aws_iam_policy_document" "circle_ci_s3_access_policy" {
  statement {
    actions = [
      "s3:*",
    ]

    resources = [
      "${aws_s3_bucket.www_joshdurbin_net.arn}",
      "${aws_s3_bucket.www_joshdurbin_net.arn}/*",
    ]
  }
}

output "circle_ci_keys" {
  value = "${aws_iam_access_key.circle_ci_deploy_key.id} -- ${aws_iam_access_key.circle_ci_deploy_key.secret}"
}
