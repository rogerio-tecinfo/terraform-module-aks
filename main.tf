resource "azurerm_kubernetes_cluster" "this" {
  name                = "k8s-${var.env}-${var.project_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "k8s-${var.env}-${var.project_name}"
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name            = var.node_pool_name
    node_count      = var.node_count
    vm_size         = var.vm_size
    os_disk_size_gb = var.os_disk_size_gb
  }

  # Managed Identity — melhor prática em vez de Service Principal
  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }

  tags = var.tags
}
