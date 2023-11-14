resource "google_compute_instance" "gcp_example_instance" {
  name         = "gcp_example_instance"
  machine_type = "n1-standard-1"
  zone         = "us-west1-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  network_interface {
    network = "default"
    access_config {}
  }
}