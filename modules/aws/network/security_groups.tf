resource "aws_security_group" "kubernetes_nodes" {
  name        = "k8s-nodes-sg"
  description = "Allow SSH ingress traffic and allow all egress traffic"
  vpc_id      = aws_vpc.kubernetes.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "k8s-nodes-sg"
  }
}

resource "aws_security_group" "load_balancer" {
  name        = "k8s-lb-sg"
  description = "Allow SSH ingress traffic from HTTP, HTTPS from Internet and allow all egress traffic"
  vpc_id      = aws_vpc.kubernetes.id

  ingress {
    description      = "Allow incoming HTTP traffic from Internet"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # Allow incoming HTTPS traffic from Internet
  ingress {
    description      = "Allow incoming HTTPS traffic from Internet"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # Allow outgoing traffic
  egress {
    description      = "Allow all outgoing traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "k8s-lb-sg"
  }
}