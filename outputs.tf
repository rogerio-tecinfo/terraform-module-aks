output "cluster_name" {
  value       = azurerm_kubernetes_cluster.this.name
  description = "Nome do cluster AKS"
}

output "cluster_id" {
  value       = azurerm_kubernetes_cluster.this.id
  description = "ID do cluster AKS"
}

output "kube_config" {
  value       = azurerm_kubernetes_cluster.this.kube_config_raw
  description = "kubeconfig completo para acesso ao cluster"
  sensitive   = true
}

output "host" {
  value     = azurerm_kubernetes_cluster.this.kube_config[0].host
  sensitive = true
}

output "client_certificate" {
  value     = base64decode(azurerm_kubernetes_cluster.this.kube_config[0].client_certificate)
  sensitive = true
}

output "client_key" {
  value     = base64decode(azurerm_kubernetes_cluster.this.kube_config[0].client_key)
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = base64decode(azurerm_kubernetes_cluster.this.kube_config[0].cluster_ca_certificate)
  sensitive = true
}

output "principal_id" {
  value       = azurerm_kubernetes_cluster.this.identity[0].principal_id
  description = "Principal ID da Managed Identity (para atribuir roles)"
}
