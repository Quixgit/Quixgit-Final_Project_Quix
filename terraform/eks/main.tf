module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  subnet_ids      = []
  vpc_id          = ""

  node_groups = {
    default = {
      desired_capacity = 1
      max_capacity     = 1
      min_capacity     = 1

      instance_types = ["t3.small"]
    }
  }
}
