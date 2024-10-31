resource "cloudflare_pages_project" "this" {
  account_id        = var.cloudflare_account_id
  name              = var.project_name
  production_branch = var.production_branch
  build_config {
    build_caching   = false
    build_command   = var.build_command
    destination_dir = var.destination_dir
    root_dir        = var.root_dir
  }
  deployment_configs {
    preview {
      always_use_latest_compatibility_date = false
      compatibility_date                   = "2024-10-27"
      compatibility_flags                  = []
      d1_databases                         = {}
      durable_object_namespaces            = {}
      environment_variables                = var.preview_environment_variables
      fail_open                            = true
      kv_namespaces                        = {}
      r2_buckets                           = {}
      usage_model                          = "standard"
    }
    production {
      always_use_latest_compatibility_date = false
      compatibility_date                   = "2024-10-27"
      compatibility_flags                  = []
      d1_databases                         = {}
      durable_object_namespaces            = {}
      environment_variables                = var.production_environment_variables
      fail_open                            = true
      kv_namespaces                        = {}
      r2_buckets                           = {}
      usage_model                          = "standard"
    }
  }
  source {
    type = "github"

    config {
      deployments_enabled     = true
      owner                   = var.github_owner
      pr_comments_enabled     = true
      preview_branch_excludes = []
      preview_branch_includes = [
        "*",
      ]
      preview_deployment_setting    = "all"
      production_branch             = var.production_branch
      production_deployment_enabled = true
      repo_name                     = var.github_repo_name
    }
  }
}
