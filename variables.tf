variable "cloudflare_account_id" {
  description = "Cloudflare account ID"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "production_branch" {
  description = "Name of the production branch"
  type        = string
}

variable "build_command" {
  description = "Command to build the project"
  type        = string
}

variable "destination_dir" {
  description = "Directory where the build command outputs the files"
  type        = string
}

variable "root_dir" {
  description = "Root directory of the project"
  type        = string
}

variable "preview_environment_variables" {
  description = "Environment variables for the preview environment"
  type        = map(string)
}

variable "production_environment_variables" {
  description = "Environment variables for the production environment"
  type        = map(string)
}

variable "github_owner" {
  description = "Owner of the GitHub repository"
  type        = string
}

variable "github_repo_name" {
  description = "Name of the GitHub repository"
  type        = string
}
