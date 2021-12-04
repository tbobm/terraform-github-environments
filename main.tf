resource "github_repository_environment" "this" {
  for_each = var.environments

  repository  = data.github_repository.this.name
  environment = each.key
}
