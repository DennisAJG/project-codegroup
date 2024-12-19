# Passo a passo para Provisionar o projeto. 

### OBS: todo esse projeto foi provisionado via máquina Linux, então poderar ter comando apt na parte de instalação. 

# Hashicorp Vault

## Instalação do vault-hashcorp 

### Instalação no Linux:

$ curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
$ sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
$ sudo apt-get update && sudo apt-get install vault

$ vault --version

## Como usar:

Poderar acessar via url: https://127.0.0.1:8200/
o vault ira passar as seguintes dados para acesso:
{
  "keys": [
    "dados"
  ],
  "keys_base64": [
    "dado que será usado para primeiro acesso "
  ],
  "root_token": "token de acesso"
}

$ vault login -tls-skip-verify token-root -> acesso ao vault via terminal 

### podemos usar o vault para armazenar por varaiveis de ambiente 
$ export VAULT_ADDR="http://127.0.0.1:8200"
$ export VAULT_TOKEN="root-token-gerado"
$ export VAULT_SKIP_VERIFY=true

## Comandos usados durante o processo de provisionamento da infrastrutura:
$ vault secrets enable -version=2 kv
$ vault kv put kv/aws-credentials access_key=access_id secret_key=secrect_id
$ vault kv get kv/aws-credentials
$ vault kv put kv/ssh-keys ansible_key="ssh-rsa ..."
$ vault kv put kv/ssh-keys jenkins_key="ssh-rsa ..." 
$ export TF_VAR_access_maquina_local="$(curl -4 ifconfig.me)/32"
$ vault kv put kv/credentials-database db_username="user_root_db" db_password="senha_password" # não são os dados que foi gerado no banco 
$ vault kv put secret/jenkins \
  access_key=$(terraform output -raw jenkins_access_key) \
  secret_key=$(terraform output -raw jenkins_secret_key)

# Ansible

## instalação via linux:

$ sudo apt update && sudo apt upgrade -y
$ sudo apt install -y software-properties-common
$ sudo add-apt-repository --yes --update ppa:ansible/ansible
$ sudo apt update

$ sudo apt install -y ansible
$ ansible --version


### Comandos usado durante o projeto:

### Server-Apps:
ansible-playbook -i inventory.ini Playbooks-Apps/etchost-playbook.yml
ansible-playbook -i inventory.ini Playbooks-Apps/nginx-playbook.yml
ansible-playbook -i inventory.ini Playbooks-Apps/playbook.yml
ansible-playbook -i inventory.ini Playbooks-Apps/mysqlclient-playbook.yml
ansible-galaxy collection install community.hashi_vault
ansible-galaxy collection install community.hashi_vault --force
sudo find / -type f -name "ansible.cfg" 2>/dev/null
sudo nano /etc/ansible/ansible.cfg

### Server Devops:
ansible-playbook -i inventory.ini Playbooks-Devops/playbook.yml
ansible-playbook -i inventory.ini Playbooks-Devops/jenkins-playbook.yml
ansible-playbook -i inventory.ini Playbooks-Devops/nginx-playbook.yml


# AWC-CLI

## Instalação via Linux:
$ sudo apt update && sudo apt upgrade -y
$ sudo apt install -y unzip curl
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
$ unzip awscliv2.zip
$ sudo ./aws/install
$ aws --version

## Configuração:

$ aws configure

## OBS:
Por motivos de segurança, foi criado um usar iam via aws-cli para não poder usar o user-root
aws iam create-user --user-name user-codegroup
aws iam attach-user-policy --user-name user-codegroup --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
aws iam attach-user-policy --user-name user-codegroup --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
aws iam create-access-key --user-name user-codegroup >> credentials.json

# Terraform 

## nesse caso aqui, vou passar o passo a passo de como foi provisionado recurso por recurso supondo que você já tenha o terraform instalado

### aqui será passado os outputs para poder ententer que os recursos foram criados
## S3 devops e apps

#### S3 devops:
terraform output              
bucket_name_app_codegroup_tfstate = "codegroup-devops-tfstate-s3-project"

#### s3 apps e dados:
terraform output
bucket_name_app_codegroup_tfstate = "codegroup-apps-tfstate-s3-project"
terraform output
bucket_arn_app_codegroup_dados = "arn:aws:s3:::codegroup-apps-dados-s3-project"
bucket_name_app_codegroup_dados = "codegroup-apps-dados-s3-project"



## Network devops e apps
#### Network devops:
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


#### Network apps:
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



## SG devops e apps

### sg_devops_jenkins:
terraform output
sg_jenkins_security_project_codegroup = "sg-06de367b45e15d2b7"
sg_name_jenkins_project_codegroup = "codegroup_devops"

### sg_apps_app:
terraform output
sg_apps_database_security_project_codegroup = "sg-09b7a829187d2a56f"
sg_apps_security_project_codegroup = "sg-0f48635d5cb885ef8"
sg_name_apps_databse_project_codegroup = "codegroup_apps_sg_rds"
sg_name_apps_project_codegroup = "codegroup_apps_sg"

### sg_apps_rds:
terraform output
sg_apps_database_security_project_codegroup = "sg-09b7a829187d2a56f"
sg_apps_security_project_codegroup = "sg-0f48635d5cb885ef8"
sg_name_apps_databse_project_codegroup = "codegroup_apps_sg_rds"
sg_name_apps_project_codegroup = "codegroup_apps_sg"


## ECR apps:
terraform output
ecr_repository_url_flask_restapi_repo_apps_codegroup = "891612581071.dkr.ecr.us-east-1.amazonaws.com/flask-restapi-apps-codegroup"


## EC2 devops e apps:

### ec2 devop_jenkins:
terraform output
instance_type = "t2.micro"
ip_sever = "44.198.76.159"
key_name_ssh = "project-aws"
security_group_id = "sg-06de367b45e15d2b7"

### ec2 apps_apps2: (usado para provisionar via modulo-locals)
terraform output
instance_type = "t2.micro"
key_name_ssh = "project-aws"
security_group_id = "sg-0f48635d5cb885ef8"

### ec2 apps_apps:
terraform output
instance_type = "t2.micro"
ip_private_server = "10.1.1.155"
ip_sever = "54.196.122.229"
key_name_ssh = "project-aws"
security_group_id = "sg-0f48635d5cb885ef8"



## RDS

### rds_apps:
terraform output
db_instance_arn = "arn:aws:rds:us-east-1:891612581071:db:databaseprojectappscodegroup"
db_instance_endpoint = "databaseprojectappscodegroup.cly6g06qycbq.us-east-1.rds.amazonaws.com:3306"



## BILLING:

### billing_devops:
terraform output
name_billing = "terraform-cost-report"
s3_prefix = "cost-reports/"


## IAM:

### iam_devops:
terraform output
iam_instance_profile = "EC2S3InstanceProfile"
jenkins_access_key = "AKIA47GCAJTHUTT7DNGC"
jenkins_secret_key = <sensitive>


