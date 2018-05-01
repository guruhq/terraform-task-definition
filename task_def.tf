resource "aws_ecs_task_definition" "container" {
  family                   = "${var.env}-${var.task_def_name}"
  container_definitions    = "${var.container_config}"
  memory                   = "${var.memory_limit}"
  task_role_arn            = "${var.service_iam_role}"
  requires_compatibilities = "${var.compatibilities}"
  network_mode             = "${var.network_mode}"
  cpu                      = "${var.cpu}"
  memory                   = "${var.memory}"
  execution_role_arn       = "${var.execution_role_arn}"
}
