locals {
  name = "${var.kube_namespace}-${var.kube_sa_name}"
}

resource "vault_kubernetes_auth_backend_role" "app" {
  role_name                        = local.name
  backend                          = var.kubernetes_auth_backend
  bound_service_account_names      = [var.kube_sa_name]
  bound_service_account_namespaces = [var.kube_namespace]
  token_ttl                        = var.token_ttl
  token_policies                   = ["default", local.name]
}

data "vault_policy_document" "app" {
  rule {
    path         = "${var.aws_secret_backend}/creds/${local.name}"
    capabilities = ["create", "read", "update", "delete", "list"]
  }
  rule {
    path         = "${var.aws_secret_backend}/sts/${local.name}"
    capabilities = ["create", "read", "update", "delete", "list"]
  }
}

resource "vault_policy" "app" {
  name   = local.name
  policy = data.vault_policy_document.app.hcl
}

resource "vault_aws_secret_backend_role" "app" {
  backend         = var.aws_secret_backend
  name            = local.name
  default_sts_ttl = var.token_ttl
  credential_type = "assumed_role"
  role_arns       = [var.aws_role_arn]
}
