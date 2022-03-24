
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.64.2"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.6.1"
    }


    helm = {
      source  = "hashicorp/helm"
      version = "2.4.1"
    }
  }
}


provider "aws" {
  region = "us-east-2"
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    token                  = data.aws_eks_cluster_auth.cluster.token
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  }
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token

}


