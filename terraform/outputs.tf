output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "ingress_load_balancer_ip" {
  value = helm_release.ingress.status[0].load_balancer_ingress[0].ip
}
