resource "aws_instance" "ec2" {
  ami                    = var.instance_ami_id
  instance_type          = var.instance_type
  subnet_id              = var.instance_subnet_id
  vpc_security_group_ids = [var.instance_security_group_id]
  user_data              = var.instance_user_data

  tags = {
    Name = var.instance_name
  }
}