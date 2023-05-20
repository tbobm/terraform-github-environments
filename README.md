# terraform-github-environments

[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/terraform-github-environments)
[![terraform-github-environments](https://github.com/tbobm/terraform-github-environments/workflows/terraform-github-environments/badge.svg)](https://github.com/tbobm/terraform-github-environments/actions?query=workflow%3Aterraform-github-environments)

Terraform module to create Github Environments for Github Actions.

## Usage

_Note: Github Actions Environments are available for Public Repositories and
Github Enterprise Cloud users. ([doc][gh-env-doc])_

[gh-env-doc]: https://docs.github.com/en/actions/deployment/targeting-different-environments/using-environments-for-deployment

### Github Authentication

You will need to authenticate against Github using an OAuth Token or Personal Access Token.
See [Github Provider#Authentication][tf-gh-auth] for more informations.

This can be done by setting the `token` argument of the `github` provider or by exporting
your Token to the `GITHUB_TOKEN` environment variable.

_Provider configuration:_
```hcl
provider "github" {
  token = var.token # or `GITHUB_TOKEN`
}
```

_Environment variable configuration:_
```bash
export GITHUB_TOKEN=ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

[tf-gh-auth]: https://registry.terraform.io/providers/integrations/github/latest/docs#authentication

### Creating the Environments

This module takes a `map` of objects for each Environement to configure.

```hcl
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
```

Here we defined two environemnts:
- the `stable` environment
- the `protected` environment with protected branches enabled

## Doc generation

Code formatting and documentation for variables and outputs is generated using
[pre-commit-terraform
hooks](https://github.com/antonbabenko/pre-commit-terraform) which uses
[terraform-docs](https://github.com/segmentio/terraform-docs).

Follow [these
instructions](https://github.com/antonbabenko/pre-commit-terraform#how-to-install)
to install pre-commit locally.

And install `terraform-docs` with `go get github.com/segmentio/terraform-docs`
or `brew install terraform-docs`.

## Contributing

Report issues/questions/feature requests on in the
[issues](https://github.com/tbobm/terraform-github-environments/issues/new)
section.

Full contributing [guidelines are covered
here](https://github.com/tbobm/terraform-github-environments/blob/master/.github/CONTRIBUTING.md).


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_repository_environment.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_environment) | resource |
| [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/repository) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environments"></a> [environments](#input\_environments) | A map of environment definitions | `map(any)` | n/a | yes |
| <a name="input_repository"></a> [repository](#input\_repository) | The full name of the repository in the form org/repo | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_environments"></a> [environments](#output\_environments) | A map of the created environments |
| <a name="output_repository"></a> [repository](#output\_repository) | The target github repository informations |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
