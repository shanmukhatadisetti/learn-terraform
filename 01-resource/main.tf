resource "aws_instance" "test" {
  ami           = data.aws_ami.ami.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_route53_record" "test" {
  zone_id = data.aws_route53_zone.zone_id.id
  name    = "test.autonagar.in"
  type    = "A"
  ttl     = 30
  records = [aws_instance.test.private_ip]
}