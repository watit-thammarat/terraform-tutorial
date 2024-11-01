resource "kubernetes_manifest" "http_route" {
  manifest = {
    apiVersion = "gateway.networking.k8s.io/v1beta1"
    kind       = "HTTPRoute"
    metadata = {
      name = "route-external-http"
      namespace = "default"      
    }
    spec = {
      parentRefs = [{
        kind = "Gateway"
        name = "mygateway1-regional"
        sectionName = "https"
      }]
      rules = [{
        backendRefs = [{
          #name = "myapp1-service"
          name = kubernetes_service_v1.service.metadata[0].name 
          port = 80
        }]
      }]
    }
  }
}
