locals {
  default_env = {
    wait_timer               = 0
    deployment_branch_policy = {}
  }
  environments = {
    for key, value in var.environments :
    key => merge(local.default_env, value)
  }
}
