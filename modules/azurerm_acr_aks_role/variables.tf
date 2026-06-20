variable "acr_id" {
  description = "Resource ID of the Azure Container Registry"
  type        = string
}

variable "aks_kubelet_identity_object_id" {
  description = "Object ID of the AKS kubelet managed identity"
  type        = string
}

variable "create_role_assignment" {
  description = "Whether to create the ACR pull role assignment for AKS"
  type        = bool
  default     = false
}
