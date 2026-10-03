output "subdomain" {
  description = "The project's pages.dev hostname"
  value       = cloudflare_pages_project.this.subdomain
}

output "custom_domains" {
  description = "Custom domains attached to the project"
  value       = sort(keys(cloudflare_pages_domain.this))
}
