variable "AKS" {
    description = "Azure Kubernetes Cluster configuration"
    type = map(object({
        aks_name                = string
        location            = string
        resource_group_name = string
        dns_prefix          = string
        node_pool_name      = string
        node_count          = number
        vm_size             = string
    }))
}