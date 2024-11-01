# Kubernetes Deployment Manifest
resource "kubernetes_deployment_v1" "myapp3" {
  metadata {
    name = "myapp3-deployment"
    labels = {
      app = "myapp3"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "myapp3"
      }
    }
    template {
      metadata {
        labels = {
          app = "myapp3"
        }
      }
      spec {
        container {
          image = "ghcr.io/stacksimplify/kubenginx:1.0.0"
          name  = "myapp3-container"
          port {
            container_port = 80
          }
          resources {
            limits = {
              cpu    = "0.25"
              memory = "256Mi"
            }
            requests = {
              cpu    = "0.25"
              memory = "256Mi"
            }
          }
        }
      }
    }
  }
}

