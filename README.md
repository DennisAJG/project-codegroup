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
bucket_name_app_codegroup_tfstate = "codegroup-devops-tfstate-s3-project"

project-codegroup/Infra/Terraform-Project/app/S3
$ terraform output              
bucket_name_app_codegroup_tfstate = "codegroup-apps-tfstate-s3-project"


### VPC para o project-devops 

Caminho onde está project devops-network:
project-codegroup/Infra/Terraform-Project/devops/NETWORK
terraform output              
cidr_blocks_private_subnet_1_project_codegroup_devops = "10.0.2.0/24"
cidr_blocks_private_subnet_2_project_codegroup_devops = "10.0.4.0/24"
cidr_blocks_public_subnet_1_project_codegroup_devops = "10.0.1.0/24"
cidr_blocks_public_subnet_2_project_codegroup_devops = "10.0.3.0/24"
id_igw_project_codegroup_devops = "igw-0513f36fed9958cc4"
id_route_table_public_project_codegroup_devops = "rtb-09b60374a7efab491"
id_subnet_private_1_project_codegroup_devops = "subnet-097aa7bde465a9cb7"
id_subnet_private_2_project_codegroup_devops = "subnet-036562ba153dde991"
id_subnet_public_1_project_codegroup_devops = "subnet-03b038a9c7d627ba8"
id_subnet_public_2_project_codegroup_devops = "subnet-0c6a7e07817542701"
vpc_cidr_project_codegroup_devops = "10.0.0.0/16"
vpc_id_project_codegroup_devops = "vpc-0b6e535a4b11a0065"
vpc_peering_id = "pcx-0c7c121d981457388"

Caminho onde está project apps-network:
project-codegroup/Infra/Terraform-Project/app/NETWORK
terraform output              
cidr_blocks_private_subnet_1_project_codegroup_apps = "10.1.2.0/24"
cidr_blocks_private_subnet_2_project_codegroup_apps = "10.1.4.0/24"
cidr_blocks_public_subnet_1_project_codegroup_apps = "10.1.1.0/24"
cidr_blocks_public_subnet_2_project_codegroup_apps = "10.1.3.0/24"
id_igw_project_codegroup_apps = "igw-0877268d796133999"
id_route_table_public_project_codegroup_apps = "rtb-0b2e90ef42ad795a7"
id_subnet_private_1_project_codegroup_apps = "subnet-09b077175c45524f9"
id_subnet_private_2_project_codegroup_apps = "subnet-071016d99047ae907"
id_subnet_public_1_project_codegroup_apps = "subnet-027ea83a0c1ea6805"
id_subnet_public_2_project_codegroup_apps = "subnet-0758abbb14bdb5726"
vpc_cidr_project_codegroup_apps = "10.1.0.0/16"
vpc_id_project_codegroup_apps = "vpc-08cb7944e26aa0c37"


### SG para o server do Jenkins
Caminho onde está project devops-sg-jenkins:
project-codegroup/Infra/Terraform-Project/devops/SG/sg-jenkins
terraform output:
sg_jenkins_security_project_codegroup = "sg-06de367b45e15d2b7"
sg_name_jenkins_project_codegroup = "codegroup_devops"


### EC2 Jenkins 
Caminho onde está project devops-ec2-jenkins:
project-codegroup/Infra/Terraform-Project/devops/EC2/jenkins

terraform output:
instance_type = "t2.micro"
ip_sever = "44.198.76.159"
key_name_ssh = "project-aws"
security_group_id = "sg-06de367b45e15d2b7"


----------------------------------------------------------------------------------------

## Arquitetura do projeto (configuração da infraestrutura)





----------------------------------------------------------------------------------------




