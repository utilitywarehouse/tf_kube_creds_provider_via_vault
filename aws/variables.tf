variable "kube_namespace" {
  type = string
}

variable "kube_sa_name" {
  type = string
}

variable "aws_role_arn" {
  type = string
}

variable "kubernetes_auth_backend" {
  type    = string
  default = "kubernetes"
}

variable "aws_secret_backend" {
  type    = string
  default = "aws"
}

variable "token_ttl" {
  type    = number
  default = 900
}
