variable "count" {}

variable "domain_name_record" {}
variable "domain_name_zone" {}
variable "domain_name_target" {}

data "aws_route53_zone" "selected" {
  count = "${var.count}"
  name  = "${var.domain_name_zone}"
}

resource "aws_route53_record" "www" {
  count   = "${var.count}"
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "${var.domain_name_record}.${data.aws_route53_zone.selected.name}"
  type    = "CNAME"
  ttl     = 60
  records = ["${var.domain_name_target}"]
}
