# Wiz Example

resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-bucket"
  acl    = "private"
  
  versioning {
    enabled = true
  }
}

