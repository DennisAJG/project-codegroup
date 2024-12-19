# Documentação projeto.

## Projeto Codegroup

Este projeto consiste no desenvolvimento de uma infraestrutura AWS simulando um ambiente produtivo com algumas ferramentas de CI e uma api simples.

Tecnologias usadas para o desenvolvimento do projeto.

## Analise de Pastas.
o projeto infra foi divido nas seguintes pastas:
Infra
  1. - Ansible-Project (pastas das playbooks para servers de devops e apps)
      1. - inventory.ini (contem os hosts)
      1. - Playbooks-Apps (contem as playbooks para server apps)
      1. - Playbooks-DevOps (contem as playbooks para server devops)


  1. - Terraform-Project (pastas onde contem toda a estrutura terraform do devops e apps)
      1. - app (pastas onde contem toda a estrutura terraform do apps)
            1. - EC2 (contem o terraform-ec2 do apps)
            1. - ECR (contem o terraform-ecr do apps)
            1. - MODULOS (contem o terraform-modulos do apps)
            1. - NETWORK (contem o terraform-networks do apps)
            1. - RDS (contem o terraform-rds do apps)
            1. - S3 (contem duas pastas com terraform-s3 uma para apps-tfstate e a outra para s3-dados)
            1. - SG (contem o terraform-sg do apps)

      1. - devops (pastas onde contem toda a estrutura terraform do devops)
            1. - BILLING (contem o terraform-billing do devops)
            1. - EC2 (contem o terraform-ec2 do jenkins)
            1. - ECR (vazio)
            1. - IAM (contem o terraform-iam do user-jenkins entre policys)
            1. - NETWORK (contem o terraform-network do devops)
            1. - RDS (vazio)
            1. - S3 (contem o terraform-s3 do devops-tfstate)
            1. - SG (contem o terraform-sg do devops-jenkins)
app-flaskapi
  1. - apps
      1. - app.py
      1. - config.py
      1. - requirements.txt
      1. - scripts.py
  1. - dockker-compose.yaml
  1. - Dockerfile
  1. - Jenkinsfile


### Cloud usada foi a AWS com os seguintes recursos:

### Na parte de Rede:

1. - Duas VPCS (devops e apps)
1. - Quatro subnets para cada VPC  (2 publicas e 2 privadas)
1. - Uma tabela de roteamento para o internet gateway
1. - Uma internet gateway
1. - Duas rotas de associação para as subnets publicas
1. - Um perring connect para fazer comunicação entre as 2 VPCs

### Na parte de Billing:

1. - Uma report\_definition para gerar relatórios
1. - Uma billing service para validar informações de cobrança
1. - Uma database Catalog para armazenar os dados relatados no S3
1. - Uma database Catalog table para gerar uma tabela para configuração do dados GZIP

### Na parte de EC2:

1. - Duas máquinas criadas uma é para o jenkins e a outra para a Aplicação Flaskapi

### Na parte de ECR:

1. - Uma ecr para armazenar a imagem criada via pipeline jenkinsfile

### Na parte de IAM:

1. - Uma IAM group para associar o usuário jenkins a um determinado grupo
1. - Tres IAM group policy para associar politicas ec2, s3 e ecr
1. - Quatro Policies onde uma é para o ECR, RDS,S3 e EC2\_ROLE\_S3
1. - Um usuário iam chamado jenkins com access\_key e secret\_key para fazer o deploy da aplicação na máquina e realizar o docker pull e push
1. - Uma iam instance profile para fazer com que EC2 se comunique com a S3

### Na parte de RDS:

1. - Um RDS do mysql versão 8.0.39 que está numa subnet-privada

### Na parte de S3:

1. - Três S3s dois para o tfstate (devops e apps) e o outro para os dados que serão armazenados os relatórios de custos

### Na parte de SG:

1. Três security-groups onde um é para RDS, outro para o EC2-Jenkins e o outro EC2-APPs

## Todo esse projeto na AWS foram provisionados via terraform, utilizando:

1. - Data (coletar via backend informações de outros recursos)
1. - variables (armazenar variáveis de credenciais e entre outros importantes)
1. - Outputs (usados para coletar informações de cada provisionamento e usados no data)
1. - Modulos locais (usado para caso o Devops possa provisionar determinado recurso com passando parametros diferentes com variáveis )
1. - locals (usado para disponibilizar tags que são usadas como padrão no projeto)
1. - Backend (usado para armazenar o tfstate de cada recurso)
1. - usado o output sensitive para não exibir dados sensíveis

# IMPORTANTE:

## Devido a complexidade do projeto, foi implementado o ### HASHICORP-VAULT para armazenar e executar alguns provisionamentos que necessitavam de dados sensíveis.

Será passado passo a passo desde como instalar e configurar o vault

### No projeto na parte de automatização de recursos, foi usado o ANSIBLE para automatizar tais processos:

1. - Instalação do docker-ce e docker-compose
1. - Nginx e realizando o proxy-reverse da 8080 para 80
1. - Configurando o /etc/hosts
1. - instalação do mysql-client
1. - instalação do awc-cli
1. - instalação do jenkins (armazenando a senha no vault)

### No projeto na parte da API, utilizei tais tecnologias:

1. - Dockerfile
1. - docker-compose
1. - Aplicação em python
1. - Jenkinsfile


### Na parte de CI-Jenkins, foi feito algumas configurações como:

1. - armazenar a senha jenkins-user no vault
1. - instalar os plugins AWS-Credentials e ssh-agent
1. - Pipeline para realizar todo o deploy da aplicação na ec2
1. - Credentials

### No github, foram feito 2 repositórios:

Parte de infraestrutura (mas tem uma pasta app-flaskapi onde tem a aplicação)

https://github.com/DennisAJG/project-codegroup/tree/main

Parte da aplicação onde é feito o deploy

https://github.com/DennisAJG/flask-restapi-codegroup


## Na parte da Arquitetura do projeto AWS-Infra, segue um diagrama de como está:
### está no repositório

# Todo o passo a passo de como foi provisionado cada recurso em cada tecnologia, crie no corpo do projeto um arquivo chamado Commands.md, que é nele que vai conter tudo o que precisa para subir a aplicação.

https://github.com/DennisAJG/project-codegroup/tree/main

