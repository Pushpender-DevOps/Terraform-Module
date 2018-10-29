resource "aws_launch_configuration" "common" {
    name                        = "common"
    image_id                    = "${var.ami_id}"
    instance_type               = "${var.instance_type}"
    iam_instance_profile        = "${aws_iam_role.common-role.id}"

    root_block_device {
      volume_type = "standard"
      volume_size = 22
      delete_on_termination = true
    }

    lifecycle {
      create_before_destroy = true
    }

    security_groups             = ["${var.security-group}"]
    associate_public_ip_address = "true"
    key_name                    = "${var.key_name}"
    user_data       = <<EOF
                                  #!/bin/bash
                                  echo ECS_CLUSTER=${var.ecs_cluster} >> /etc/ecs/ecs.config
                                  EOF


}

  data "template_file" "user_data" {
  template = "${file("${path.module}/user-data.sh")}"                              
  }

