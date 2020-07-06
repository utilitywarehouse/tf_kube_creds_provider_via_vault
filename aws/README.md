## Usage

```hcl
module "tf_kube_creds_provider_via_vault" {
  source = "github.com/utilitywarehouse/tf_kube_creds_provider_via_vault//aws"

  kube_namespace = "example-namespace"
  kube_sa_name   = "example"
  aws_role_arn   = "arn:aws:iam::000000000000:role/example"
}
```

Check `variables.tf` for detailed descriptions and optional variables.
