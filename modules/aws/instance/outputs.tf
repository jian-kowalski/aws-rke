
output "public_ips" {
  value = aws_instance.nodes[*].public_ip
}

output "private_ips" {
  value = aws_instance.nodes[*].private_ip
}

output "instance_ids" {
  value = aws_instance.nodes[*].id
}

output "ssh_private_key" {
  value = local_file.ssh_private_key.filename
}


output "private_key_pem" {
  value = tls_private_key.ssh.private_key_pem
}

