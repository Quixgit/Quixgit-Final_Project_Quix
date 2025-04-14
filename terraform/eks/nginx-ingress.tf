resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.9.1"
  namespace  = "ingress-nginx"
  create_namespace = true

  values = [file("${path.module}/nginx-values.yaml")]
}
