resource "aws_ecs_service" "common" {
  	name            = "common"
  	#iam_role        = "${var.iam_role}"
	launch_type     = "EC2"
    cluster         = "${aws_ecs_cluster.common-cluster.name}"
	task_definition = "${aws_ecs_task_definition.common.family}:${max("${aws_ecs_task_definition.common.revision}", "${data.aws_ecs_task_definition.common.revision}")}"
    desired_count   = 1

  	load_balancer {
    	target_group_arn  = "${aws_alb_target_group.common-target-group.arn}"
    	container_port    = 8080
    	container_name    = "${var.container_name}"
	}

}