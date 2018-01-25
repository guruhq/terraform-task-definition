# terraform-task-definition 

A terraform module that allows you to create an ECS task definition 

## Usage

Three files are needed - main.tf variables.tf and the task_def.json.tpl file

## main.tf example
```hcl
data "template_file" "task_def_config" {
  template = "${file("task_def.json.tpl")}"

  vars {
    image_name     = "${var.image_name}"
    image_revision = "${var.image_revision}"
  }
}

module "task_definition" {
  source           = "git::ssh://git@github.com/guruhq/terraform-task-definition?ref=0.1.0"
  service_iam_role = "arn:aws:iam::495243515911:role/dev-service-role"
  container_config = "${data.template_file.task_def_config.rendered}"
  task_def_name    = "example"
  memory_limit     = "512"
  env              = "dev"
}

terraform {
  backend "s3" {
    bucket = "guru-terraform-state"
    key    = "dev/example/terraform.tfstate"
    region = "us-west-2"
  }
}
```

## variables.tf example
```hcl
variable "image_name" {
  default = "dev-example"
}
variable "image_revision" {
  default = "74"
}
variable "env" {
  default = "dev"
}
variable "task_def_name" {
  default = "example"
}
variable "region" {
  default = "us-west-2"
}
```

##task_def.json.tpl example
```json
[
  {
    "name": "example",
    "image": "${image_name}:${image_revision}",
    "memory": 512,
    "essential": true,
    "hostname": "example.getguru.com",
    "command": [
        "ls",
        "-al"
    ],
    "portMappings": [
      { 
        "containerPort": 80
      }
    ],
    "logConfiguration": {
        "logDriver": "json-file",
        "options": null
    }
  }
]
```
## Variables

- `task_def_name` - The name of the task def you're creating {the env will be appended to the beginning of the name} (Default: `unknown`)
- `container_config` - The config file - this is passed through via the template_file terraform resource (Default: `unknown`)
- `service_iam_role` - The IAM Role ARN to be used with the container (Default `unknown`)
- `env` - The environment (Default: `dev`)
- `memory_limit` - Hard memory limit to kill the container at (Default: `1024`)
- `region` - Where it all happens (Default: `us-west-2`)

## Outputs
