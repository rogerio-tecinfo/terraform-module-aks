variable "env" {
  type        = string
  description = "Ambiente do cluster (dev, qa, stg, prd)"

  validation {
    condition     = length(var.env) <= 4
    error_message = "O nome do ambiente deve ter no máximo 4 caracteres."
  }
}

variable "project_name" {
  type        = string
  description = "Nome do projeto — usado como sufixo nos recursos"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group onde o cluster será criado"
}

variable "location" {
  type        = string
  description = "Região Azure"
  default     = "eastus"
}

variable "kubernetes_version" {
  type        = string
  description = "Versão do Kubernetes"
  default     = null
}

variable "node_pool_name" {
  type        = string
  description = "Nome do node pool padrão"
  default     = "default"
}

variable "node_count" {
  type        = number
  description = "Quantidade de nós no pool padrão"
  default     = 2
}

variable "vm_size" {
  type        = string
  description = "Tamanho das VMs do node pool"
  default     = "Standard_DS2_v2"
}

variable "os_disk_size_gb" {
  type        = number
  description = "Tamanho do disco OS dos nós em GB"
  default     = 50
}

variable "tags" {
  type    = map(string)
  default = {}
}
