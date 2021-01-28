resource "aws_eks_node_group" "example" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "example"
  node_role_arn   = aws_iam_role.eks-role.arn
  subnet_ids      = aws_subnet.eks-subnet-[*].id

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }