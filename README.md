# project-codegroup
Projeto de uma infraestrutura em Terraform

## Instrução para o provisionamento de toda a infraestrutura via terraform, ansible e hashicorp-vault. 

Comando aws-cli para criação de user-iam e em seguida, criar um acesso via CLI 

 aws iam create-user --user-name user-codegroup
 aws iam attach-user-policy --user-name user-codegroup --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
 aws iam attach-user-policy --user-name user-codegroup --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
 aws iam create-access-key --user-name user-codegroup >> credentials.json

 Comandos usados para armazenar o acess-key e secret-key no hashicorp-vault

 link de acesso local:
 https://127.0.0.1:8200/

 Comandos usados:
 $ vault login -tls-skip-verify token-root
 $ export VAULT_ADDR="https://127.0.0.1:8200
 $ export VAULT_SKIP_VERIFY=true  (USADO para não validar certificado TLS (usado para ambiente de desenvolvimento e testes))
 $ source ~/.zshrc
 $ vault secrets enable -version=2 kv
 $ vault kv put kv/aws-credentials access_key=access_id secret_key=secrect_id
 $ vault kv get kv/aws-credentials


## Processos do levantamento da infraestrutura:

### S3 para o tfstate
o primeiro provisionamento via terraform foi o s3 para armazenar os tfstates. 
caminho onde está armazenado:
project-codegroup/Infra/Terraform-Project/devops/S3
$ terraform output              
bucket_name_app_getrak_tfstate = "codegroup-devops-tfstate-s3-project"

project-codegroup/Infra/Terraform-Project/app/S3


----------------------------------------------------------------------------------------

## Arquitetura do projeto (configuração da infraestrutura)





----------------------------------------------------------------------------------------




