module "env" {
  source = "../"

  repository = "tbobm/terraform-github-secrets"

  environments = {
    "stable" = {}

    "protected" = {
      deployment_branch_policy = {
        protected_branches     = true
        custom_branch_policies = false
      }
    }
  }
}

output "this" {
  value       = module.env
  description = "The env module outputs"
}
