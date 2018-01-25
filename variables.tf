variable "region" {
  default = "us-west-2"
}
variable "memory_limit" {
  default = "1024"
}
variable "env" {
  default = "qa"
}
variable "service_iam_role" {}
variable "container_config" {}
variable "task_def_name" {}
