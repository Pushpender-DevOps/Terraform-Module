resource "aws_alb" "common-load-balancer" {
    name                = "common-load-balancer"
    security_groups     = ["${var.security-group}"]
    subnets             = ["${var.subnet_id_elb}","${var.subnet_id}"]

    tags {
      Name = "common-load-balancer"
    }
}