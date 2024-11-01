# Terraform Settings Block
terraform {
  required_version = ">= 1.9"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.32"
    }
  }
  backend "gcs" {
    bucket = "terraform-on-gcp-gke4"
    prefix = "dev/k8s-gateway-regional-demo1"
  }
}

