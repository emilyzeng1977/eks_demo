terraform {
  required_version = ">= 0.12"
  backend "s3" {
    region   = "ap-southeast-2"
    bucket   = "tom.niu25.eks"
    key      = "eks_demo/terraform.tfstate"
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {}

# Not required: currently used in conjunction with using
# icanhazip.com to determine local workstation external IP
# to open EC2 Security Group access to the Kubernetes cluster.
# See workstation-external-ip.tf for additional information.
provider "http" {}
