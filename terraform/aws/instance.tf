# Minimal Default

resource "aws_instance" "example_instance" {
  ami           = "ami-08e2c1a8d17c2fe17"
  instance_type = "t2.nano"
}

# Terraform Registry Example

resource "aws_ebs_volume" "example_ebs_volume" {
  availability_zone = "us-west-2a"
  encrypted         = false
  size              = 1

}

resource "aws_instance" "example_instance_with_ebs" {
  ami           = "ami-08e2c1a8d17c2fe17"
  instance_type = "t2.nano"
}

resource "aws_volume_attachment" "example_volume_attachment" {
  device_name = "/dev/sdh"
  instance_id = aws_instance.example_instance_with_ebs.id
  volume_id   = aws_ebs_volume.example_ebs_volume.id
}
