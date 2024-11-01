resource "google_compute_address" "static_ip" {
  name         = "my-vm-ip"
  region       = var.gcp_region
  network_tier = "PREMIUM"
}
