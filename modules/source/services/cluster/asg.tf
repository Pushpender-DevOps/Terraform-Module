resource "aws_autoscaling_group" "common-autoscaling-group" {
    name                        = "common-autoscaling-group"
    max_size                    = "${var.max_size}"
    min_size                    = "${var.min_size}"
    desired_capacity            = "${var.desired_capacity}"
    vpc_zone_identifier         = ["${var.subnet_id}"]
    launch_configuration        = "${aws_launch_configuration.common.name}"
    health_check_type           = "ELB"

    tag {
    key                 = "Name"    
    value               = "${var.cluster_name}"
    key                 = "project"
    value             = "${var.project_name}"
    key                 = "env"

    value                 = "${var.env_name}"
    propagate_at_launch = true
}
  }