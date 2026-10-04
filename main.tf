locals {
  # The v5 provider takes env_vars as { NAME = { type, value } }; callers
  # keep passing plain maps of strings.
  preview_env_vars = {
    for k, v in var.preview_environment_variables : k => { type = "plain_text", value = v }
  }
  production_env_vars = {
    for k, v in var.production_environment_variables : k => { type = "plain_text", value = v }
  }
}

resource "cloudflare_pages_project" "this" {
  account_id        = var.cloudflare_account_id
  name              = var.project_name
  production_branch = var.production_branch

  build_config = {
    build_caching   = false
    build_command   = var.build_command
    destination_dir = var.destination_dir
    root_dir        = var.root_dir
  }

  deployment_configs = {
    preview = {
      always_use_latest_compatibility_date = false
      compatibility_date                   = "2024-10-27"
      env_vars                             = local.preview_env_vars
      fail_open                            = true
    }
    production = {
      always_use_latest_compatibility_date = false
      compatibility_date                   = "2024-10-27"
      env_vars                             = local.production_env_vars
      fail_open                            = true
    }
  }

  source = {
    type = "github"
    config = {
      owner                          = var.github_owner
      pr_comments_enabled            = true
      preview_branch_includes        = ["*"]
      preview_deployment_setting     = "all"
      production_branch              = var.production_branch
      production_deployments_enabled = true
      repo_name                      = var.github_repo_name
    }
  }
}

# The DNS records pointing these names at <project>.pages.dev are managed
# separately (e.g. octodns); this only attaches the names to the project.
resource "cloudflare_pages_domain" "this" {
  for_each = toset(var.custom_domains)

  account_id   = var.cloudflare_account_id
  project_name = cloudflare_pages_project.this.name
  name         = each.value
}
