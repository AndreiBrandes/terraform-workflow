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
#https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release
#resource "helm_release" "nginx" {
#  chart = "nginx"
#  name  = "nginx"
#  repository = "https://charts.bitnami.com/bitnami"
#  recreate_pods = true
#  values = [
#    file("${path.module}/nginx-values.yaml")
#  ]
#}
#resource "helm_release" "localchart" {
#  name       = "my-local-chart"
#  chart      = "./charts/chart1"
#  #https://github.com/hashicorp/terraform-provider-helm/issues/515
#  values = [
#    yamlencode(
#    {dummy: uuid()}
#    )
#  ]
#}
resource "helm_release" "localchart2" {
  name       = "my-local-chart2"
  chart      = "./charts/chart2"
  #https://github.com/hashicorp/terraform-provider-helm/issues/515
  values = [
    yamlencode({dummy: uuid()})
  ]
  set {
    name  = "recreate_pods"
    value = "true"
  }
  set {
    name  = "force_update"
    value = "true"
  }
}