module "argocd" {
  source       = "path_to_helm_chart_or_manifest"
  cluster_name = module.eks.cluster_name
}
