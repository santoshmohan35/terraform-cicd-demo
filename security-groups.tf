resource "aws_security_group" "jenkins_sg" {
  name   = "jenkins-sg"
  vpc_id = module.vpc.vpc_id

  ingress {
    description = "Allow SSH from admin IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["106.222.204.21/32"]
  }

  ingress {
    description = "Allow Jenkins Web UI (port 8080)"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "jenkins-sg"
    Environment = var.env
  }
}
