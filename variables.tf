variable "www_joshdurbin_net" {
  default = "www.joshdurbin.net"
}

variable "joshdurbin_net" {
  default = "joshdurbin.net"
}

variable "mail_joshdurbin_net" {
  default = "mail.joshdurbin.net"
}

variable "default_aws_region" {
  default = "us-west-2"
}

variable "default_google_region" {
  default = "us-west1"
}

variable "default_google_zone" {
  default = "us-west1-a"
}

variable "gcp_node_type" {
  default = "n1-standard-1"
}

variable "gcp_cluster_count" {
  default = "1"
}

variable "cluster_name" {
  default = "test"
}

variable "digital_ocean_mail_server_machine_image" {
  default = "debian-9-x64"
}

variable "digital_ocean_mail_server_machine_type" {
  default = "s-1vcpu-1gb"
}

variable "default_digitalocean_zone" {
  default = "sfo2"
}

variable "global_ttl" {
  default = "60"
}

variable "digital_ocean_token" {}

variable "www_joshdurbin_net_certificate_id" {}
variable "canary_username" {}
variable "canary_encrypted_password" {}

variable "k8s_cluster_linux_admin_username" {}
variable "k8s_cluster_linux_admin_password" {}
