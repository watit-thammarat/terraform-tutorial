resource "kubernetes_manifest" "myapp1_gcp_backend_policy" {
  manifest = {
    apiVersion = "networking.gke.io/v1"
    kind       = "GCPBackendPolicy"
    metadata = {
      name      = "myapp1-backend-policy"
      namespace = "default"
    }
    spec = {
      default = {
        sessionAffinity = {
          type         = "GENERATED_COOKIE"  # or "CLIENT_IP"
          cookieTtlSec = 50
        }
      }
      targetRef = {
        group = ""
        kind  = "Service"
        name  = kubernetes_service_v1.service.metadata[0].name 
      }
    }
  }
}
