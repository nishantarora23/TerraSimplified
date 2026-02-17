output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnet_ids
}

output "instance_public_ip" {
  value       = module.webserver.instance_public_ip
}

output "instance_id" {
  value       = module.webserver.instance_id
}
