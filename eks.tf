module "eks_cluster" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "${var.project_name}-eks"
  cluster_version = "1.28"
  subnet_ids      = ["subnet-00930275b025e1c03"]
  vpc_id          = "vpc-060fd218b9daa72e0"

 resource "aws_eks_node_group" "example" {
  cluster_name    = aws_eks_cluster.example.name
  node_group_name = "example-node-group"
  node_role_arn   = aws_iam_role.eks_node.arn
  subnet_ids      = [subnet-00930275b025e1c03, subnet-0c68210ac790a0f26]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
  }

  tags = {
    Environment = "Dev"
    Project     = var.project_name
  }
}