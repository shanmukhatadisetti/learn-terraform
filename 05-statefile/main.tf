terraform {
  backend "s3" {
    bucket = "shanmukhatadisetti"
    key    = "05-statefile/terraform.statefile"
    region = "us-east-1"
  }
}

resource "null_resource" "test" {
  provisioner "local-exec" {
    command = "echo hello universe"
  }
}