variable "sg_kubernetes_nodes" {
  description = "Security group id"
}

variable "public_subnets_id" {
  description = "Public subnetes"
}

variable "instance_type" {
  default = "t2.medium"
}

