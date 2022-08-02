# terraform-aws_rke_cluster

Módulo Terraform que cria um cluster RKE, destinado a criar cluster "mestre" do Rancher altamente disponível.


## Introdução

### Propósito

O objetivo deste módulo é fornecer de maneira fácil um cluster "mestre" do Rancher pronto para produção, por isso inclui (quase) tudo o que é necessário para ter o Rancher em funcionamento, incluindo a infraestrutura de computação da AWS, cluster Kubernetes, balanceador de carga e a própria implantação do Rancher.

### Projeto

#### Resources provisioned

- [x]  3 instâncias do EC2 - oferece a capacidade de atualizar a AMI de um grupo de nós por vez para que você possa fazer uma atualização in-loco

  - Não usa AutoScalingGroups.
  - Cria nós do Ubuntu com o Docker instalado.

- [x] Um cluster Kubernetes instalado nas instâncias do EC2
  - Usa o provedor Terraform RKE
  - Rotula todos os nós com ["controlplane", "etcd", "worker"]- Lembre-se de que este cluster deve ser usado como o cluster mestre do Rancher e nada mais.

- [x] Um Classic Load Balancer (ELB) com listeners na porta 80 e porta 443 que aponta para a porta 80 e 443 dos nós do cluster.
    - O elb grupo de segurança é usado pelo balanceador de carga e permite o tráfego nas portas 80 e 443 de qualquer lugar.
- [x] Um par de chaves da AWS com uma nova chave privada TLS


## Pré-requisitos

- terraform: https://github.com/terraform-docs/terraform-docs
- Aws: https://aws.amazon.com/

## Executar 

`
 terraform apply -auto-approve
`

Informar sua chave de acesso e sua chave secreta. 


## Saida

| Name | Description |
|------|-------------|
| cluster\_kubeconfig |Conteúdo do arquivo yaml KUBECONFIG para se conectar ao cluster.  |
| Load Balancer\_endpoint | Ponto de acesso para as aplicações |
| ssh\_private\_key | Chave SSH privada dos nós do cluster |
| ssh\_public\_key | Chave SSH pública dos nós do cluster |




