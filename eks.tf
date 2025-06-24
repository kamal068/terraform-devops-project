module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.5"

  cluster_name    = "example"
  cluster_version = "1.27"
  subnet_ids       = ["subnet-00930275b025e1c03"]
  vpc_id  = "vpc-1234567890abcdef0"

  eks_managed_node_groups = {
    example = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_types = ["t2.micro"]
    }
  }
}
