# terraform-cloudflare-pages-github

Simple Terraform module to deploy a static site to Cloudflare Pages from a GitHub repository.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | 4.45.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 4.45.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_pages_project.this](https://registry.terraform.io/providers/cloudflare/cloudflare/4.45.0/docs/resources/pages_project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_build_command"></a> [build\_command](#input\_build\_command) | Command to build the project | `string` | n/a | yes |
| <a name="input_cloudflare_account_id"></a> [cloudflare\_account\_id](#input\_cloudflare\_account\_id) | Cloudflare account ID | `string` | n/a | yes |
| <a name="input_destination_dir"></a> [destination\_dir](#input\_destination\_dir) | Directory where the build command outputs the files | `string` | n/a | yes |
| <a name="input_github_owner"></a> [github\_owner](#input\_github\_owner) | Owner of the GitHub repository | `string` | n/a | yes |
| <a name="input_github_repo_name"></a> [github\_repo\_name](#input\_github\_repo\_name) | Name of the GitHub repository | `string` | n/a | yes |
| <a name="input_preview_environment_variables"></a> [preview\_environment\_variables](#input\_preview\_environment\_variables) | Environment variables for the preview environment | `map(string)` | n/a | yes |
| <a name="input_production_branch"></a> [production\_branch](#input\_production\_branch) | Name of the production branch | `string` | n/a | yes |
| <a name="input_production_environment_variables"></a> [production\_environment\_variables](#input\_production\_environment\_variables) | Environment variables for the production environment | `map(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project | `string` | n/a | yes |
| <a name="input_root_dir"></a> [root\_dir](#input\_root\_dir) | Root directory of the project | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
