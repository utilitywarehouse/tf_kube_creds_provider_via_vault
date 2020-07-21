variable "environment" {
  type = string
}

variable "kube_namespace" {
  type = string
}

variable "kube_sa_name" {
  type = string
}

variable "gcp_role" {
  type = string
}

variable "gcp_project" {
  type = string
}

variable "kubernetes_auth_backend" {
  type    = string
  default = "kubernetes"
}

variable "gcp_secret_backend" {
  type    = string
  default = "gcp"
}

variable "token_ttl" {
  type    = number
  default = 900
}
