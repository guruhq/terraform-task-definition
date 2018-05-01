variable "region" {
  default = "us-west-2"
}
variable "memory_limit" {
  default = "1024"
}
variable "env" {
  default = "qa"
}
variable "compatibilities" {
  default = ["EC2"]
}
variable "network_mode" {
  default = "bridge"
}
variable "cpu" {
  default = "1024"
}
variable "memory" {
  default = "2048"
}
variable "service_iam_role" {}
variable "container_config" {}
variable "task_def_name" {}
variable "execution_role_arn" {}
