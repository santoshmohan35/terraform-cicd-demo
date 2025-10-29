provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block        = var.vpc_cidr_block
  public_subnet_cidr    = var.public_subnet_cidr
  private_subnet_cidr   = var.private_subnet_cidr
  availability_zone_pub = var.availability_zone_pub
  availability_zone_pri = var.availability_zone_pri
  project_name          = var.project_name
}

module "jenkins" {
  source = "./modules/jenkins"

  name              = "jenkins-master"
  ami_id            = var.ami_id
  instance_type     = "t3.micro"
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = aws_security_group.jenkins_sg.id
  key_name          = var.key_name
  env               = var.env
  tags = {
    Owner   = "Santosh"
    Project = "CI-CD"
  }
}
