
output "ssh-with-ubuntu-user" {
  value = format("Para acessar no nodes via ssh, use:\n %s: ", join(
    "\n",
    [for i in module.aws_instance.public_ips :
      format(
        "ssh -l ubuntu -p 22 -i %s %s",
        module.aws_instance.ssh_private_key,
        i
      )
    ]
  ))
}

output "dns_acess" {
  value = format("Para acesar a aplicação wordpress: %s", module.aws_load_balancer.dns_name)
}
