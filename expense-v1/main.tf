resource "aws_instance" "frontend" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0a4c0688a00749ae0"]

  tags = {
    Name = "fromtend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z056004628V1082ZXL76U"
  name    = "www.frontend.autonagar.in"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}