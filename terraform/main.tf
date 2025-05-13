provider "azurerm" {
  features {}
  subscription_id = "c61832b7-438a-45e7-8d88-aafb995db5e1"
}


resource "azurerm_resource_group" "rg" {
  name     = "rajtharan-devops-rg"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "rajtharan-aks-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "rajtharanaks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
  }

  tags = {
    environment = "dev"
    project     = "cloud-native-devops"
  }
}

resource "azurerm_container_registry" "acr" {
  name                = "rajtharanacrregistry"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}
