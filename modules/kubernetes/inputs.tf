variable "api_server_url" {
  description = "cluster value"
}
variable "kube_admin_user" {
  description = "cluster value"
}
variable "client_cert" {
  description = "cluster value"
}
variable "client_key" {
  description = "cluster value"
}
variable "ca_crt" {
  description = "cluster value"
}
variable "dns_name" {
  description = "Host acess"
}

variable "ns_longhorn" {
  default = "longhorn-system"
}

variable "longhorn_repo" {
  default = "https://charts.longhorn.io"
}

variable "longhorn_chart" {
  default = "longhorn"
}

variable "longhorn" {
  default = "longhorn"
}

variable "ns_wordpress" {
  default = "wordpress"
}

variable "wordpress_repo" {
  default = "https://charts.bitnami.com/bitnami"
}

variable "wordpress_chart" {
  default = "wordpress"
}
variable "wordpress_chart_version" {
  default = "15.0.12"
}

variable "wordpress" {
  default = "wordpress"
}