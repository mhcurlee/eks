# get account ID

data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}


resource "aws_iam_role" "k8s-admin-role" {
  name = "eks-k8s-admin-role-${var.project_name}"


  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          "AWS" : "${local.account_id}"
        }
      },
    ]
  })

  tags = {
    tag-key = "EKS-${var.project_name}"
  }
}


resource "aws_iam_role" "k8s-dev-role" {
  name = "eks-k8s-dev-role-${var.project_name}"


  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          "AWS" : "${local.account_id}"
        }
      },
    ]
  })

  tags = {
    tag-key = "EKS-${var.project_name}"
  }
}