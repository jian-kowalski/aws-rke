module "aws_network" {
  source         = "./modules/aws/network"
  aws_region     = var.aws_region
}

module "aws_instance" {
  source              = "./modules/aws/instance"
  sg_kubernetes_nodes = module.aws_network.sg_kubernetes_nodes
  public_subnets_id   = module.aws_network.public_subnets_id
}


module "rke_cluster" {
  source = "./modules/rke"

  private_ips     = module.aws_instance.private_ips
  public_ips      = module.aws_instance.public_ips
  private_key_pem = module.aws_instance.private_key_pem
}

module "aws_load_balancer" {
  source            = "./modules/aws/load_balancer"
  sg_load_balancer  = module.aws_network.sg_load_balancer
  public_subnets_id = module.aws_network.public_subnets_id
  instance_ids      = module.aws_instance.instance_ids
}



module "kubernetes" {
  source = "./modules/kubernetes"

  api_server_url  = module.rke_cluster.host
  kube_admin_user = module.rke_cluster.username
  client_cert     = module.rke_cluster.client_certificate
  client_key      = module.rke_cluster.client_key
  ca_crt          = module.rke_cluster.cluster_ca_certificate
  dns_name        = module.aws_load_balancer.dns_name

}