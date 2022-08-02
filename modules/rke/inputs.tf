variable "private_ips" {
  default = "Privates Ips"
}

variable "public_ips" {
  description = "Publics Ips"
}

variable "private_key_pem" {
  description = "Private key"
}

variable "cluster_name" {
  type    = string
  default = "k8s-cluster"
}

variable "kube_version" {
  default = "v1.22.4-rancher1-1"
}
