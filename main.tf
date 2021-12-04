resource "github_repository_environment" "this" {
  for_each = local.environments

  repository  = data.github_repository.this.name
  environment = each.key

  wait_timer = lookup(each.value, "wait_timer", 0)

  dynamic "deployment_branch_policy" {
    for_each = each.value["deployment_branch_policy"] == {} ? [] : [1]

    content {
      protected_branches     = each.value.deployment_branch_policy["protected_branches"]
      custom_branch_policies = each.value.deployment_branch_policy["custom_branch_policies"]
    }
  }
}
