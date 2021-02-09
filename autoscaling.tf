resource "aws_launch_configuration" "example-launchconfig" {
  name_prefix     = "example-launchconfig"
  image_id        = var.AMIS[var.AWS_REGION]
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.myinstance.id]
 # user_data       = "#!/bin/bash\nsudo yum update -y\nsudo yum install -y docker\nsudo service docker start\nsudo yum install git -y\nsudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` | sudo tee /usr/local/bin/docker-compose > /dev/null\nsudo chmod +x /usr/local/bin/docker-compose\nsudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose\ngit clone https://github.com/meacod/spring-boot-monitoring-sample.git\ndocker-compose up"
  user_data = "${file("install.sh")}"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "example-autoscaling" {
  name                      = "example-autoscaling"
  vpc_zone_identifier       = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id]
  launch_configuration      = aws_launch_configuration.example-launchconfig.name
  min_size                  = 2
  max_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  load_balancers            = [aws_elb.my-elb.name]
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "ec2 instance"
    propagate_at_launch = true
  }
}

