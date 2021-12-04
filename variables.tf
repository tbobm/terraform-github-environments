variable "repository" {
  type        = string
  description = "The full name of the repository in the form org/repo"
}

variable "environments" {
  type        = map(any)
  description = "A map of environment definitions"
}
