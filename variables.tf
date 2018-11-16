variable "www_joshdurbin_net" {
  default = "www.joshdurbin.net"
  type    = "string"
}

variable "joshdurbin_net" {
  default = "joshdurbin.net"
  type    = "string"
}

variable "mail_joshdurbin_net" {
  default = "mail.joshdurbin.net"
  type    = "string"
}

variable "default_aws_region" {
  default = "us-west-2"
  type    = "string"
}

variable "g_suite_verification_key" {
  default = "google-site-verification=D7549H_UGkF8EPc-0m1ChBEWQC_sMW-iIUeRtvxhJx8"
  type    = "string"
}

variable "g_suite_mail_dkim" {
  default = [
    "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuhEjsqG07ljLzjY0i/T7AXyX6n+s2x+Ef90gZEIcQqkZWMHGtcya\" \"gMBo4JB0kcDOoPzclpA6sHEZzOakDcRuI8MraRywrUF+bu8gSCz9lPAwN4mjF5Xm/ZIHMAxeHPyaTqaRJOTZpm2TX9eKvgf82BoKuJlFEHe2Jf8t5\" \"7qPAeVt/EbccPalNqrVe5WxRYcKgseT2BP3wdumJ6xXVuS1i/T3rEDDBj37P8GqKTfkp5NQITtXwW4IQwtUEyuXnh42LlstyYxsP6D95SBypTwPkC\" \"T70CUZ71H7xJ9Rd6zMLi6O/RKVL2pCvpR9PwLbVXr8oB1d5M40tS76yXDvQgblowIDAQAB",
  ]

  type = "list"
}

variable "g_suite_mx_verification_key" {
  default = "15 udqpaqboo4oyxjp27e5myhezdw6qfjrhf7ap7nmddfqighyz7vzq.mx-verification.google.com."
  type    = "string"
}

variable "default_google_region" {
  default = "us-west1"
  type    = "string"
}

variable "default_google_zone" {
  default = "us-west1-a"
  type    = "string"
}

variable "global_ttl" {
  default = "60"
  type    = "string"
}

variable "www_joshdurbin_net_certificate_id" {
  default = "8c7b5e0d-69c9-4a7d-b053-94206824e3dd"
  type    = "string"
}

variable "k8s_cluster_name" {
  default = "test"
  type = "string"
}

variable "k8s_cluster_matchine_type" {
  default = "n1-standard-1"
  type = "string"
}

variable "k8s_cluster_node_count" {
  default = "1"
  type = "string"
}

variable "k8s_cluster_master_auth_user" {}
variable "k8s_cluster_master_auth_password" {}