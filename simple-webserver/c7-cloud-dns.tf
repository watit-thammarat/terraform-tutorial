locals {
  mydomain         = "demo.tongnakub.dev"
  dns_managed_zone = "tongnakub-dev"
}

# Resource: Cloud DNS Record Set for A Record
resource "google_dns_record_set" "a_record" {
  managed_zone = local.dns_managed_zone
  name         = "${local.mydomain}."
  type         = "A"
  ttl          = 300
  rrdatas      = [google_compute_address.static_ip.address]
}
