output "workspace_id" {
  value = azurerm_log_analytics_workspace.log_analytics.id
}

output "workspace_key" {
  value     = azurerm_log_analytics_workspace.log_analytics.primary_shared_key
  sensitive = true
}

output "customer_id" {
  value = azurerm_log_analytics_workspace.log_analytics.workspace_id
}
