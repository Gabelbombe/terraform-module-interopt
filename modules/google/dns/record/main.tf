variable "count" {}

variable "domain_name_record" {}
variable "domain_name_zone" {}
variable "domain_name_target" {}

resource "google_dns_record_set" "frontend" {
  count = "${var.count}"
  name  = "${var.domain_name_record}.${var.domain_name_zone}"
  type  = "CNAME"
  ttl   = 300

  managed_zone = "${var.domain_name_zone}"

  rrdatas = ["${var.domain_name_target}"]
}
