variable "cloud_provider" {}

variable "domain_name_record" {}
variable "domain_name_zone" {}
variable "domain_name_target" {}

module "dns" {
  cloud_provider = "${var.cloud_provider}"

  source             = "./modules/generic/dns/record"
  domain_name_record = "${var.domain_name_record}"
  domain_name_zone   = "${var.domain_name_zone}"
  domain_name_target = "${var.domain_name_target}"
}

output "provider" {
  value = "Implementing Cloud Provider: ${var.cloud_provider}"
}
