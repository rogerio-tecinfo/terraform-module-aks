# terraform-module-aks

Módulo Terraform para criação de cluster AKS (Azure Kubernetes Service).

---

## Recursos criados

- `azurerm_kubernetes_cluster` — cluster AKS com Managed Identity
- Network profile Azure CNI com load balancer Standard

---

## Uso

```hcl
module "aks" {
  source = "github.com/rogerio-tecinfo/terraform-module-aks"

  env                 = "dev"
  project_name        = "weatherapp"
  resource_group_name = "RG02"
  location            = "eastus"
  node_count          = 2
  vm_size             = "Standard_DS2_v2"

  tags = {
    managed_by = "terraform"
    ambiente   = "dev"
  }
}
```

---

## Variáveis

| Nome | Tipo | Default | Descrição |
|---|---|---|---|
| `env` | string | — | Ambiente (dev, qa, stg, prd) — máx 4 chars |
| `project_name` | string | — | Nome do projeto |
| `resource_group_name` | string | — | Resource Group existente |
| `location` | string | `eastus` | Região Azure |
| `kubernetes_version` | string | `null` | Versão K8s (null = última estável) |
| `node_pool_name` | string | `default` | Nome do node pool |
| `node_count` | number | `2` | Quantidade de nós |
| `vm_size` | string | `Standard_DS2_v2` | Tamanho das VMs |
| `os_disk_size_gb` | number | `50` | Tamanho do disco OS em GB |
| `tags` | map(string) | `{}` | Tags dos recursos |

---

## Outputs

| Nome | Sensível | Descrição |
|---|---|---|
| `cluster_name` | Não | Nome do cluster AKS |
| `cluster_id` | Não | ID do cluster AKS |
| `kube_config` | ✅ Sim | kubeconfig completo |
| `host` | ✅ Sim | Endpoint da API K8s |
| `client_certificate` | ✅ Sim | Certificado do cliente |
| `client_key` | ✅ Sim | Chave do cliente |
| `cluster_ca_certificate` | ✅ Sim | CA do cluster |
| `principal_id` | Não | Managed Identity Principal ID |

---

## Boas práticas aplicadas

- **Managed Identity** em vez de Service Principal (sem secrets)
- Todos os outputs de kubeconfig marcados como `sensitive = true`
- Providers e backend **não** incluídos no módulo (pertencem ao root module)
- Grafana/Prometheus separados em módulo próprio
- Região configurável via variável
