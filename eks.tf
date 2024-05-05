module "eks_cluster" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.5"
  cluster_name    = "${var.namespace}-eks-cluster"
  cluster_version = var.kubernetes_version

  create_iam_role = true

  tags = {
    OWNER     = var.tag_owner
    CATEGORY  = var.tag_category
    cluster = "${var.namespace}-eks-cluster"
  }

  vpc_id = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets

  enable_irsa = true

  eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64"
    instance_types         = ["t3.medium"]
    vpc_security_group_ids = [aws_security_group.worker_sg.id]
  }

  eks_managed_node_groups = {

    node_group = {
      min_size     = var.min_capacity
      max_size     = var.max_capacity
      desired_size = var.desired_capacity
    }
  }
}