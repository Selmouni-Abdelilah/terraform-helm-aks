resource "kubernetes_namespace" "helm_terraform" {
  depends_on   = [azurerm_kubernetes_cluster.default]
  metadata {
    name = "helm-terraform"
  }
}
resource "kubernetes_namespace" "grafana" {
  depends_on   = [azurerm_kubernetes_cluster.default]
  metadata {
    name = "grafana"
  }
}

resource "helm_release" "nginx_ingress" {
  depends_on   = [azurerm_kubernetes_cluster.default]
  name = "nginx"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"
  namespace = kubernetes_namespace.helm_terraform.metadata.0.name

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}
resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace = kubernetes_namespace.grafana.metadata.0.name
  set {
    name = "service.type"
    value = "LoadBalancer"
  }
}


