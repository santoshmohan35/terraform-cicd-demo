variable "name" {
  description = "Jenkins instance name"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for Ubuntu"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for Jenkins"
  type        = string
  default     = "t3.medium"
}

variable "subnet_id" {
  description = "Subnet ID where Jenkins will run"
  type        = string
}


variable "key_name" {
  description = "SSH key pair for Jenkins EC2"
  type        = string
}

variable "env" {
  description = "Environment tag (dev/stage/prod)"
  type        = string
}

variable "tags" {
  description = "Additional tags for Jenkins EC2"
  type        = map(string)
  default     = {}
}
