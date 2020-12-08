### AutoScaling Group

resource "aws_autoscaling_group" "asg-web" {
  name = "aws_autoscaling_group"
    
  load_balancers = [aws_elb.web_elb.id]
  launch_configuration = aws_launch_configuration.web.id

  min_size             = 1
  desired_capacity     = 2
  max_size             = 4
  health_check_grace_period = 300
  health_check_type    = "ELB"
  
  force_delete = true  

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]

  metrics_granularity = "1Minute"
  
 vpc_zone_identifier  = [
    aws_subnet.main-1.id,
    aws_subnet.main-2.id
  ]

  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "asg-web"
    propagate_at_launch = true
  }

}
