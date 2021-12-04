resource "github_actions_secret" "example_secret" {
  repository      = "example_repository"
  secret_name     = "example_secret_name"
  plaintext_value = "hello"
}
