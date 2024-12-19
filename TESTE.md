Projeto Codegroup

Este projeto consiste no desenvolvimento de uma infraestrutura AWS simulando um ambiente produtivo com algumas ferramentas de CI e uma API simples.

Tecnologias Utilizadas

Cloud: AWS

Rede:

Duas VPCs:

devops

apps

Subnets:

Quatro subnets para cada VPC (2 públicas e 2 privadas).

Tabela de Roteamento:

Configurada para o Internet Gateway.

Internet Gateway.

Associações de Rota:

Para subnets públicas.

Peering Connection:

Comunicação entre as duas VPCs.

Billing:

Report Definition:

Para gerar relatórios de uso e custo.

Billing Service:

Para validação de informações de cobrança.

Database Catalog:

Armazenamento dos dados relatados no S3.

Database Catalog Table:

Geração de tabela para configuração dos dados GZIP.

EC2:

Duas Instâncias EC2:

Uma para o Jenkins.

Outra para a aplicação FlaskAPI.

ECR:

ECR:

Armazena a imagem criada via pipeline do Jenkinsfile.

IAM:

IAM Group:

Para associar o usuário Jenkins a um grupo.

IAM Group Policies:

Políticas para EC2, S3 e ECR.

Policies:

Uma para cada recurso: ECR, RDS, S3 e EC2_ROLE_S3.

Usuário IAM (Jenkins):

Criado com access_key e secret_key para deploy da aplicação e operações no Docker (pull/push).

IAM Instance Profile:

Permite a comunicação entre EC2 e S3.

RDS:

RDS MySQL:

Versão 8.0.39.

Configurado em uma subnet privada.

S3:

Três Buckets S3:

Dois para armazenar o tfstate (devops e apps).

Um para armazenar os relatórios de custos.

SG (Security Groups):

Três Security Groups:

Um para o RDS.

Um para o EC2 do Jenkins.

Um para o EC2 da aplicação FlaskAPI.

Provisionamento com Terraform

O projeto utiliza Terraform para provisionar toda a infraestrutura:

Data:

Coleta informações de outros recursos via backend.

Variables:

Armazena variáveis como credenciais e configurações importantes.

Outputs:

Usados para coletar informações de cada provisionamento e referenciados no data.

Módulos Locais:

Permitem reutilização de código para provisionar recursos com diferentes parâmetros.

Locals:

Define tags padrão para o projeto.

Backend:

Configurado para armazenar os arquivos de estado (tfstate).

Output Sensitive:

Configurado para ocultar dados sensíveis.

Segurança

Devido à complexidade do projeto, foi implementado o HashiCorp Vault para armazenar e executar provisionamentos que requerem dados sensíveis. Um passo a passo detalhado de como instalar e configurar o Vault está disponível no repositório.

Automatização com Ansible

O projeto utiliza Ansible para automatizar processos:

Instalação do Docker-CE e Docker-Compose.

Configuração do Nginx:

Proxy reverso da porta 8080 para 80.

Configuração do /etc/hosts.

Instalação do mysql-client.

Instalação do aws-cli.

Instalação do Jenkins (senha armazenada no Vault).

Desenvolvimento da API

A API foi desenvolvida com as seguintes tecnologias:

Dockerfile

Docker-Compose

Python

Jenkinsfile

Integração Contínua (CI) com Jenkins

Configurações realizadas:

Armazenamento da Senha:

A senha do usuário Jenkins foi armazenada no Vault.

Plugins Instalados:

AWS-Credentials

ssh-agent

Pipeline:

Realiza o deploy completo da aplicação na EC2.

Credentials:

Configuradas para integração com AWS e SSH.

Repositórios

Infraestrutura:

Contém toda a configuração da infraestrutura e uma pasta com a aplicação FlaskAPI.

Infraestrutura Codegroup

Aplicação:

Repositório dedicado ao código da aplicação e deploy.

Aplicação FlaskAPI

Arquitetura do Projeto

O diagrama da arquitetura AWS-Infrastructure está disponível no repositório:

Diagrama no Repositório

Documentação de Provisionamento

Todo o passo a passo para provisionar cada recurso está disponível no arquivo Commands.md, localizado no corpo do projeto:

Commands.md

