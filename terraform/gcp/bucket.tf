# Terraform Registry Example

resource "google_storage_bucket" "gcp_example_bucket" {
  name          = "www.example.com"
  cors {
    origin          = ["http://www.example.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
  force_destroy = true
  location      = "US"
  uniform_bucket_level_access = true
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}
