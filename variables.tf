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
    "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAujkPAxwewhXEcYQXbG2IKrIUN1BhWygRboEUFcfyuraQFsfWtW29\" \"KyglCXZHbyluMgXJM2FnOcbAAlZbH9KSOqoSunG16ObGwbCN5P04zrOFCO17FGrKSMVVO8ThYbveGjIycTSYUfAiXaPrXgShPmieSwDK9Fo7igVGJ\" \"RF/AEi1i/C/mS/P1EgUy7Ib7p4Py6fVusZojqIL9RmzmVasu+x3foOGK7c22mpfjjpWxMVIK9VX5T3GG7ouso1zDF0aDEUODvizaDAaX3qTeHKbqN\" \"GMIZL8w4GtptR/cjTIlczltIkteHhwGYha+tvoKMqv16gFOIP9O2woClsJ9ioH6wIDAQAB"
  ]

  type = "list"
}

variable "g_suite_mx_verification_key" {
  default = "15 UDQPAQBOO4OYXJP27E5MYHEZDW6QFJRHF7AP7NMDDFQIGHYZ7VZQ.MX-VERIFICATION.GOOGLE.COM."
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