module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "pitstop"
  cluster_version = "1.28"

  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = "vpc-09c3215d66a7eba14"
  subnet_ids               = ["subnet-076e8b9c393d0af0a", "subnet-0e098891fbfae12e4"]
  control_plane_subnet_ids = ["subnet-0e098891fbfae12e4", "subnet-076e8b9c393d0af0a"]



  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["t2.large", "t2.large"]
  }

  eks_managed_node_groups = {
    blue = {}
    green = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = ["t2.large"]
      capacity_type  = "SPOT"
    }
  }



  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}