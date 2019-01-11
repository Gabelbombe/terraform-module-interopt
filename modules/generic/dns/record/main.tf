variable "cloud_provider" {}

variable "domain_name_record" {}
variable "domain_name_zone" {}
variable "domain_name_target" {}

module "aws_dns_record" {
  source             = "../../../aws/dns/record"
  count              = "${var.cloud_provider == "aws" ? 1 : 0}"
  domain_name_record = "${var.domain_name_record}"
  domain_name_zone   = "${var.domain_name_zone}"
  domain_name_target = "${var.domain_name_target}"
}

module "azure_dns_record" {
  source             = "../../../google/dns/record"
  count              = "${var.cloud_provider == "azure" ? 1 : 0}"
  domain_name_record = "${var.domain_name_record}"
  domain_name_zone   = "${var.domain_name_zone}"
  domain_name_target = "${var.domain_name_target}"
}

module "google_dns_record" {
  source             = "../../../google/dns/record"
  count              = "${var.cloud_provider == "google" ? 1 : 0}"
  domain_name_record = "${var.domain_name_record}"
  domain_name_zone   = "${var.domain_name_zone}"
  domain_name_target = "${var.domain_name_target}"
}
