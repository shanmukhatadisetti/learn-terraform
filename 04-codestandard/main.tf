resource "null_resource" "test" {
  provisioner "local-exec" {
    command = "echo hello universe - ${var.env}.enviromnt"
  }
}

variable "env" {}
terraform {
  backend "s3" {}
}