resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.46.0"
  namespace  = "argocd"

  create_namespace = true

  values = [
    <<-EOF
    server:
      service:
        type: LoadBalancer
    EOF
  ]
}
