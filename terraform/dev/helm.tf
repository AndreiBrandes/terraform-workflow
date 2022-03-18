provider "helm" {
  kubernetes {
    host = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      command     = "aws"
      args = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.cluster.name]
    }
}
}

resource "helm_release" "nginx" {
  chart = "nginx"
  name  = "nginx"
  repository = "https://charts.bitnami.com/bitnami"

  values = [
    file("${path.module}/nginx-values.yaml")
  ]
}