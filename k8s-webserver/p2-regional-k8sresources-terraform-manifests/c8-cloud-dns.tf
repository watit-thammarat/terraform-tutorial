# Locals Block
## 1. You should have a registered Domain
## 2. Your registered domain is configured in Cloud DNS for DNS management
## 3. Refer Section-15: Cloud Domains and Cloud DNS for complete understanding
locals {
  mydomain         = "app.tongnakub.dev"
  dns_managed_zone = "tongnakub-dev"
}

# Resource: Cloud DNS Record Set for A Record
resource "google_dns_record_set" "a_record" {
  #project      = "kdaida123"
  managed_zone = local.dns_managed_zone
  name         = "${local.mydomain}."
  type         = "A"
  ttl          = 300
  rrdatas      = [google_compute_address.static_ip.address]
}
