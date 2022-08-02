resource "kubernetes_namespace" "wordpress" {
  metadata {
    annotations = {
      name = var.wordpress
    }

    labels = {
      mylabel = var.wordpress
    }

    name = var.ns_wordpress
  }
}

resource "helm_release" "wordpress" {
  name       = var.wordpress
  repository = var.wordpress_repo
  chart      = var.wordpress
  namespace  = var.ns_wordpress
  version    = var.wordpress_chart_version
  depends_on = [
    kubernetes_namespace.wordpress,
    helm_release.longhorn
  ]


  set {
    name  = "ingress.enabled"
    value = true
  }
  set {
    name  = "ingress.hostname"
    value = var.dns_name
  }

  set {
    name  = "ingress.pathType"
    value = "Prefix"
  }

  set {
    name  = "service.type"
    value = "NodePort"
  }
}