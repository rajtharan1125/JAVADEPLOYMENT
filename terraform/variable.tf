variable "location" {
  description = "Azure region to deploy resources"
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "rajtharan-devops-rg"
}

variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
  default     = "rajtharan-aks-cluster"
}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  default     = "rajtharanacrregistry"
}
