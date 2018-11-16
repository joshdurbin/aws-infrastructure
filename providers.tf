provider "aws" {
  region = "${var.default_aws_region}"
}

terraform {
  required_version = ">= 0.9.0"

  backend "s3" {
    bucket     = "jdurbin-terraform-state"
    key        = "permanent.tfstate"
    region     = "us-west-2"
    encrypt    = true
    kms_key_id = "arn:aws:kms:us-west-2:795557596088:key/c64abdc4-7cfc-4f4f-b184-de3a67468ebf"
  }
}

provider "google" {
  credentials = "${file("~/.google_auth/k8s_test_land.json")}"
  project     = "k8s-test-land"
  region      = "${var.default_google_region}"
}