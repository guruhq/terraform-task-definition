resource "aws_ecs_task_definition" "container" {
  family                = "${var.env}-${var.task_def_name}"
  container_definitions = "${var.container_config}"
  memory                = "${var.memory_limit}"
  task_role_arn         = "${var.service_iam_role}"
  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b, us-west-2c]"
  }
}
