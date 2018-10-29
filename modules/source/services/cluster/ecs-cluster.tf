     resource "aws_ecs_cluster" "common-cluster" {
    name = "${var.cluster_name}"
}