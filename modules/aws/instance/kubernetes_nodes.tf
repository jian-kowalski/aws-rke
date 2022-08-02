resource "aws_instance" "nodes" {
  count = 3

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  key_name = aws_key_pair.ssh.key_name

  subnet_id = var.public_subnets_id[count.index % 2]

  root_block_device {
    delete_on_termination = true
    encrypted             = true
    volume_size           = 20
    volume_type           = "gp2"

    tags = {
      Name = "node 0${count.index + 1}"
    }
  }

  vpc_security_group_ids = [var.sg_kubernetes_nodes]

  user_data = file("${path.module}/user_data/provisioning.sh")

  tags = {
    Name = "Worker Node ${count.index + 1}"
  }
}