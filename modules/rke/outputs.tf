output "host" {
  value = rke_cluster.cluster.api_server_url
}
output "username" {
  value = rke_cluster.cluster.kube_admin_user
}
output "client_certificate" {
  value = rke_cluster.cluster.client_cert
}
output "client_key" {
  value = rke_cluster.cluster.client_key
}
output "cluster_ca_certificate" {
  value = rke_cluster.cluster.ca_crt
}
