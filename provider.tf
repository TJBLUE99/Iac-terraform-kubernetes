terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/Kubernetes"
      version = "2.11.0"
    }
  }
}

provider "kubernetes" {
    config_path = "~/.kube/config"
    config_context = "minikube"
}
