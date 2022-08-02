resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "local_file" "ssh_private_key" {
  content         = tls_private_key.ssh.private_key_pem
  filename        = "id_rsa.pem"
  file_permission = "0600"
}


resource "local_file" "ssh_public_key" {
  content         = tls_private_key.ssh.public_key_openssh
  filename        = "id_rsa.pub"
  file_permission = "0600"
}

resource "aws_key_pair" "ssh" {
  key_name   = "id_rsa"
  public_key = tls_private_key.ssh.public_key_openssh
}