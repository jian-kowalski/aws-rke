resource "kubernetes_namespace" "longhorn" {
  metadata {
    annotations = {
      name = var.longhorn
    }

    labels = {
      mylabel = var.longhorn
    }

    name = var.ns_longhorn
  }
}

resource "helm_release" "longhorn" {
  name       = var.longhorn
  repository = var.longhorn_repo
  chart      = var.longhorn_chart
  namespace  = var.ns_longhorn
  depends_on = [
    kubernetes_namespace.longhorn
  ]
}