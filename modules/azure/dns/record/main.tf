variable "count" {}

variable "domain_name_record" {}
variable "domain_name_zone" {}
variable "domain_name_target" {}

resource "azurerm_resource_group" "dns" {
  name     = "${var.domain_name_record}.${domain_name_zone}"
  location = "US West"
}

resource "azurerm_dns_zone" "selected" {
  count = "${var.count}"
  name  = "${var.domain_name_zone}"
}

resource "azurerm_dns_a_record" "www" {
  name                = "${var.domain_name_record}.${azurerm_dns_zone.selected.name}"
  zone_name           = "${azurerm_dns_zone.selected.name}"
  resource_group_name = "${azurerm_resource_group.dns.name}"
  ttl                 = 300
  records             = ["${var.domain_name_target}"]
}
