data "aws_ecs_task_definition" "common" {
  task_definition = "${aws_ecs_task_definition.common.family}"
}

resource "aws_ecs_task_definition" "common" {
    family                = "common"
    container_definitions = "${file("task.json")}"
}
