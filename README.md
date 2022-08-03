# Terraform aws rke cluster wordpress

Módulo Terraform que cria um cluster RKE altamente disponível.


## Introdução

Criação de cluster, no cloud aws, com a diponiblização de uma aplicação wordpress com acesso a internet. 

### Propósito

O objetivo deste módulo é fornecer de maneira fácil um cluster "mestre" (quase) pronto para produção, está incluso a infraestrutura de computação da AWS, cluster Kubernetes, balanceador de carga e a própria implantação do cluster com RKE, configuração do kubernetes e helm
e o deploy de uma aplicação Wordpress.

### Projeto

#### Recursos

- [x]  3 instâncias do EC2 - oferece a capacidade de atualizar a AMI de um grupo de nós por vez para que você possa fazer uma atualização in-loco
  - Não usa AutoScalingGroups.
  - Cria nós com Ubuntu com o Docker instalado.

- [x] Um cluster Kubernetes instalado nas instâncias do EC2
  - Usa o provedor Terraform RKE
  - Rotula todos os nós com ["controlplane", "etcd", "worker"]- Lembre-se de que este cluster deve ser usado como o cluster de teste e nada mais.

- [x] Um Classic Load Balancer (ELB) com listeners na porta 80 e porta 443 que aponta para a porta 80 e 443 dos nós do cluster.
    - O elb grupo de segurança é usado pelo balanceador de carga e permite o tráfego nas portas 80 e 443 de qualquer lugar.

- [x] Um par de chaves da AWS com uma nova chave privada TLS.

- [x] Uma aplicação Wordpress com acesso a internet.
  - Banco de dados utilizado é o mysql

Obs: É possivel instalar qualquer aplicação nesse ambiente, via helm ou manifestos.
## Pré-requisitos

- terraform instalado, com a versão  ~>v1.2.2: https://github.com/terraform-docs/terraform-docs
- Criar uma conta na Aws: https://aws.amazon.com/

## Executar 

`
 terraform apply -auto-approve
`

Informar sua chave de acesso e sua chave secreta. 


## Saida

| Name | Description |
|------|-------------|
| cluster\_kubeconfig |Conteúdo do arquivo yaml KUBECONFIG para se conectar ao cluster.  |
| Load Balancer\_endpoint | Ponto de acesso para ao WordPress |
| ssh\_private\_key | Chave SSH privada dos nós do cluster |
| ssh\_public\_key | Chave SSH pública dos nós do cluster |
