resource "aws_security_group" "publicEC2Security" {
  vpc_id = var.production-vpc
  name   = "PublicSecurityGroup"

  dynamic "ingress" {
    for_each = var.sgPortsPublic
    content {
      from_port       = ingress.value
      to_port         = ingress.value
      protocol        = "tcp"
      cidr_blocks     = ["88.68.100.222/32"]
    }
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

/*
resource "aws_security_group" "albSecurityGroup" {
  name   = "albSecurityGruop"
  vpc_id = var.production-vpc
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}*/