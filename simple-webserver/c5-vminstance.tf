# Resource Block: Create a single Compute Engine instance
resource "google_compute_instance" "myapp1" {
  name                      = "myapp1"
  machine_type              = var.machine_type
  zone                      = var.gcp_zone
  allow_stopping_for_update = true
  tags = [
    tolist(google_compute_firewall.fw_ssh.target_tags)[0],
    tolist(google_compute_firewall.fw_http.target_tags)[0]
  ]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  # Install Webserver
  metadata_startup_script = file("${path.module}/app1-webserver-install.sh")
  network_interface {
    subnetwork = google_compute_subnetwork.mysubnet.id
    access_config {
      # Include this section to give the VM an external IP address
      nat_ip = google_compute_address.static_ip.address
    }
  }
}
