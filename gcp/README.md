## Usage

```hcl
module "tf_kube_creds_provider_via_vault" {
  source = "github.com/utilitywarehouse/tf_kube_creds_provider_via_vault//gcp"

  kube_namespace = "example-namespace"
  kube_sa_name   = "example"
  gcp_project    = "example-project"
  gcp_role       = "example-role"
}
```

Check `variables.tf` for detailed descriptions and optional variables.
