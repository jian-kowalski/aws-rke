
resource "aws_elb" "rke_cp_elb" {
  name = "elb"

  subnets = var.public_subnets_id

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:6443"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "elb"
  }

  security_groups = [var.sg_load_balancer]
}

resource "aws_elb_attachment" "rke_server0_lb_attachment" {
  elb      = aws_elb.rke_cp_elb.id
  instance = var.instance_ids[0]
}

resource "aws_elb_attachment" "rke_initserver1_lb_attachment" {
  elb      = aws_elb.rke_cp_elb.id
  instance = var.instance_ids[1]
}

resource "aws_elb_attachment" "rke_initserver2_lb_attachment" {
  elb      = aws_elb.rke_cp_elb.id
  instance = var.instance_ids[2]
}