resource "aws_alb_target_group" "common-target-group" {
    name                = "common-target-group"
    port                = "8080"
    protocol            = "HTTP"
    vpc_id              = "${var.vpc-id}"

    health_check {
        healthy_threshold   = "5"
        unhealthy_threshold = "2"
        interval            = "30"
        matcher             = "200"
        path                = "/"
        port                = "traffic-port"
        protocol            = "HTTP"
        timeout             = "5"
    }

    tags {
      Name = "common-target-group"
    }
}

resource "aws_alb_listener" "alb-http-listener" {
    load_balancer_arn = "${aws_alb.common-load-balancer.arn}"
    port              = "8080"
    protocol          = "HTTP"

    default_action {
        target_group_arn = "${aws_alb_target_group.common-target-group.arn}"
        type             = "forward"
    }
}

resource "aws_alb_listener" "alb-https-listener" {
    load_balancer_arn = "${aws_alb.common-load-balancer.arn}"
    port              = "443"
    protocol          = "HTTPS"


    ssl_policy        = "${var.ssl_policy}"
  certificate_arn   = "certificate arn"

    default_action {
        target_group_arn = "${aws_alb_target_group.common-target-group.arn}"
        type             = "forward"
    }

} 