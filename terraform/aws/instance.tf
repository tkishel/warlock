resource "aws_instance" "aws_example_instance" {
  ami           = "ami-830c94e3"
  instance_type = "t2.nano"
}
