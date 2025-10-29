output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}


output "instance_public_ip" {
  description = "Public IP of EC2 instance from jenkins"
  value       = module.jenkins.jenkins_public_ip
}
