resource "rke_cluster" "cluster" {
  cluster_name       = var.cluster_name
  kubernetes_version = var.kube_version
  disable_port_check = false
  delay_on_creation  = 180
  addon_job_timeout  = 60
  depends_on         = [var.private_ips, var.public_ips]
  nodes {
    address          = var.public_ips[0]
    internal_address = var.private_ips[0]
    user             = "ubuntu"
    ssh_key          = var.private_key_pem
    role             = ["controlplane", "worker", "etcd"]
  }
  nodes {
    address          = var.public_ips[1]
    internal_address = var.private_ips[1]
    user             = "ubuntu"
    ssh_key          = var.private_key_pem
    role             = ["controlplane", "worker", "etcd"]
  }
  nodes {
    address          = var.public_ips[2]
    internal_address = var.private_ips[2]
    user             = "ubuntu"
    ssh_key          = var.private_key_pem
    role             = ["controlplane", "worker", "etcd"]
  }

  network {
    plugin = "flannel"
  }
  authorization {
    mode = "rbac"
  }
  monitoring {
    provider = "none"
  }
  upgrade_strategy {
    drain                        = true
    max_unavailable_worker       = "20%"
    max_unavailable_controlplane = "1"
  }
}


resource "local_file" "kube_cluster_yaml" {
  filename = "${path.root}/kube_config_cluster.yml"
  content  = rke_cluster.cluster.kube_config_yaml
}

resource "local_file" "rke_cluster_yaml" {
  filename = "${path.root}/cluster.yml"
  content  = rke_cluster.cluster.rke_cluster_yaml
}

resource "local_file" "rke_state" {
  filename = "${path.root}/cluster.rkestate"
  content  = rke_cluster.cluster.rke_state
}