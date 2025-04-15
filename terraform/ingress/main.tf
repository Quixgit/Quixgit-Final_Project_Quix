provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.7.0"
  namespace  = "ingress-nginx"

  create_namespace = true

  values = [
    <<-EOF
    controller:
      service:
        type: LoadBalancer
    EOF
  ]
}
