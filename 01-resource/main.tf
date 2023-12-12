resource "aws_instance" "test" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_route53_record" "test1" {
  zone_id = "Z10413961HT8PFBW9XTRT"
  name    = "test.autonagar.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.test.private_ip]
}