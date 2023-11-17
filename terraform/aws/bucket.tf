# Terraform Registry Example
#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

resource "aws_s3_bucket" "aws_example_bucket" {
  bucket = "aws-example-bucket"
}
