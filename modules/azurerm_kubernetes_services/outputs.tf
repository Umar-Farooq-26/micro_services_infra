output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "cluster_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config[0]
  sensitive = true
}

output "kubelet_identity_object_id" {
  description = "Object ID of the kubelet managed identity (used for ACR pull role assignment)"
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

output "oidc_issuer_url" {
  description = "OIDC issuer URL for Workload Identity federation"
  value       = azurerm_kubernetes_cluster.aks.oidc_issuer_url
}
