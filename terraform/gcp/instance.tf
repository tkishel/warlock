# Terraform Registry Example

resource "google_service_account" "example_service_account" {
  account_id   = "example-service-account"
  display_name = "Example Service Account for VM Instance"
}

resource "google_compute_instance" "gcp_example_instance" {
  name         = "gcp_example_instance"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }
  machine_type = "n2-standard-2"
  metadata_startup_script = "echo '{secret: secret}' > /etc/secret.json"
  network_interface {
    network = "default"
    access_config {}
  }
  scratch_disk {
    interface = "NVME"
  }
  service_account {
    email  = google_service_account.example_service_account.email
    scopes = ["cloud-platform"]
  }
  zone         = "us-west2-a"
}


