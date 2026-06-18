variable "acr" {
    type = map(object({
        acr_name = string
        resource_group_name = string
        acr_location = string
        acr_sku = string

    }))
}