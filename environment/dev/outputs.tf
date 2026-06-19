output "aks_cluster_name" {
  description = "AKS cluster name"
  value       = { for k, v in module.aks : k => v.cluster_name }
}

output "acr_login_server" {
  description = "ACR login server URLs"
  value       = { for k, v in module.acr : k => v.login_server }
}

output "key_vault_uri" {
  description = "Key Vault URIs"
  value       = { for k, v in module.key_vault : k => v.vault_uri }
}

output "vnet_id" {
  description = "Virtual Network IDs"
  value       = { for k, v in module.vnet : k => v.vnet_id }
}

output "log_analytics_workspace_id" {
  description = "Log Analytics Workspace IDs"
  value       = { for k, v in module.log_analytics : k => v.workspace_id }
}
