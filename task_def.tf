resource "aws_ecs_task_definition" "container" {
  family                   = "${var.env}-${var.task_def_name}"
  container_definitions    = "${var.container_config}"
  task_role_arn            = "${var.service_iam_role}"
  requires_compatibilities = "${var.compatibilities}"
  network_mode             = "${var.network_mode}"
  cpu                      = "${var.cpu}"
  memory                   = "${var.memory}"
  execution_role_arn       = "${var.execution_role_arn}"

  dynamic "volume" {
    for_each = var.volume == null ? [] : [var.volume]

    content {
      name      = volume.value.name
      host_path = volume.value.host_path
    }
  }
}
