terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.12.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.6.0"

    }
  }
}

provider "helm" {
  kubernetes {
    host                   = var.api_server_url
    username               = var.kube_admin_user
    client_certificate     = var.client_cert
    client_key             = var.client_key
    cluster_ca_certificate = var.ca_crt
  }
}
provider "kubernetes" {
  host                   = var.api_server_url
  username               = var.kube_admin_user
  client_certificate     = var.client_cert
  client_key             = var.client_key
  cluster_ca_certificate = var.ca_crt
}
