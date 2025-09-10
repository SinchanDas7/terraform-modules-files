output "bastion_id" {
  description = "ID of the bastion instance"
  value       = aws_instance.bastion.id
}

output "bastion_public_ip" {
  description = "Public IP of the bastion instance"
  value       = aws_instance.bastion.public_ip
}

output "bastion_sg_id" {
  description = "Security Group ID of bastion host"
  value       = aws_security_group.bastion_sg.id
}
