variable "security_group_id" { type = string }


resource "aws_instance" "jenkins" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  # Override user_data to install Jenkins instead of Nginx
  user_data = file("${path.module}/files/install_jenkins.sh")

  tags = merge(
    {
      Name        = "${var.env}-${var.name}"
      Environment = var.env
      Role        = "jenkins"
      ManagedBy   = "Terraform"
    },
    var.tags
  )
}
