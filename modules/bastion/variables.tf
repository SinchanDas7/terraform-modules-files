variable "name" {
  description = "Prefix name for resources"
  type        = string
  default     = "sinchan"
}

variable "vpc_id" {
  description = "VPC ID where bastion will be deployed"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID to deploy bastion"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for bastion host"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for bastion host"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}
