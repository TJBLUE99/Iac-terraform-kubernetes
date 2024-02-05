resource "kubernetes_namespace" "samplenamespace" {
  metadata {
    name = "samplenamespace"
  }
}

resource "kubernetes_deployment" "nginxdeployment" {
  metadata {
    name = "nginxdeployment"
    namespace = "samplenamespace"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "nginx"
      }
    }
    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }
      spec {
        container {
          image = "nginx"
          name = "nginx"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "nginxservice" {
  metadata {
    name = "nginxservice"
    namespace = "samplenamespace"
  }
  spec {
    selector = {
      app = "nginxdeployment"
    }
    port {
      port = 80
    }
  }
}