variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr_block" {
  description = "CIDR for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone_pub" {
  description = "AZ for public subnet"
  type        = string
  default     = "ap-south-1a"
}

variable "availability_zone_pri" {
  description = "AZ for private subnet"
  type        = string
  default     = "ap-south-1b"
}

variable "project_name" {
  description = "Tag name for resources"
  type        = string
  default     = "devops-lab"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI ID"
  type        = string
  default     = "ami-0f5ee92e2d63afc18"
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "env" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}
