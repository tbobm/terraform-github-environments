output "repository" {
  value       = data.github_repository.this
  description = "The target github repository informations"
}

output "environments" {
  value       = github_repository_environment.this
  description = "A map of the created environments"
}
