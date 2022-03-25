
/*
# Install metrics server
# TODO: yamldecode does not deal with multiple blocks with --- sep.  Had to break into 9 files and loop.
resource "kubernetes_manifest" "metrics-server" {
  count = 9
  manifest = yamldecode(file("${path.module}/${count.index}.yaml"))
  
}
*/

# Install prometheus

resource "kubernetes_namespace" "prometheus-namespace" {
  metadata {
    annotations = {
      name = "prometheus"
    }
    name = "prometheus"
  }
  
}


resource "helm_release" "prometheus" {
  name       = "prometheus-community"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  namespace = kubernetes_namespace.prometheus-namespace.id  
  
  set {
    name  = "alertmanager.persistentVolume.storageClass"
    value = "gp2"
  }
  set {
    name  = "server.persistentVolume.storageClass"
    value = "gp2"
  }

  
}
