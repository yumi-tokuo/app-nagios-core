variable "instance_ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_subnet_id" {
  type = string
}

variable "instance_security_group_id" {
  type = string
}

variable "instance_user_data" {
  type    = string
  default = <<EOF
#!/bin/bash
echo "EC2 instance created!"
    EOF
}

variable "instance_name" {
  type    = string
  default = "ec2"
}