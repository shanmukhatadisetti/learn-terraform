resource "aws_instance" "frontend" {
  ami           = data.aws_ami.ami.image_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [data.aws_security_group.sg.id]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z056004628V1082ZXL76U"
  name    = "frontend.autonagar.in"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "null_resource" "frontend" {
  depends_on = [aws_route53_record.frontend]
  provisioner "local-exec" {
    command = <<EOF
cd /home/centos/expense-ansible
git pull
sleep 60
ansible-playbook -i ${aws_instance.frontend.private_ip}, -e ansible_user=centos -e ansible_password=DevOps321 expense.yml -e role_name=frontend
EOF
  }
}