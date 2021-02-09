resource "aws_elb" "my-elb" {
  name            = "my-elb"
  subnets         = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id]
  security_groups = [aws_security_group.elb-securitygroup.id]
  listener {
    instance_port     = 8080
    instance_protocol = "tcp"
    lb_port           = 8080
    lb_protocol       = "tcp"
  }
  
  listener {
    instance_port     = 9090
    instance_protocol = "tcp"
    lb_port           = 9090
    lb_protocol       = "tcp"
  }
  
  listener {
    instance_port     = 3000
    instance_protocol = "tcp"
    lb_port           = 3000
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 5
    timeout             = 10
    target              = "HTTP:8080/"
    interval            = 300
  }

  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 400
  tags = {
    Name = "my-elb"
  }
}

