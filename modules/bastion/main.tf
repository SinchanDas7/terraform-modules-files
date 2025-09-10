resource "aws_security_group" "bastion_sg" {
  name        = "${var.name}-bastion-sg"
  description = "Security group for Bastion host"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from anywhere (restrict in prod)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${var.name}-bastion-sg"
  })
}

resource "aws_instance" "bastion" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  key_name                    = var.key_name

  tags = merge(var.tags, {
    Name = "${var.name}-bastion"
  })
}
