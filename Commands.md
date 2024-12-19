# Passo a passo para Provisionar o projeto. 

### OBS: todo esse projeto foi provisionado via máquina Linux, então poderar ter comando apt na parte de instalação. 

# Hashicorp Vault

## Instalação do vault-hashcorp 

### Instalação no Linux:

$ curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
$ sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
$ sudo apt-get update && sudo apt-get install vault

$ vault --version

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

podemos usar o vault para armazenar por varaiveis de ambiente 
$ export VAULT_ADDR="http://127.0.0.1:8200"
$ export VAULT_TOKEN="root-token-gerado"
$ export VAULT_SKIP_VERIFY=true

Comandos usados durante o processo de provisionamento da infrastrutura:
$ vault secrets enable -version=2 kv
$ vault kv put kv/aws-credentials access_key=access_id secret_key=secrect_id
$ vault kv get kv/aws-credentials
$ vault kv put kv/ssh-keys ansible_key="ssh-rsa ..."
$ vault kv put kv/ssh-keys jenkins_key="ssh-rsa ..." 
$ export TF_VAR_access_maquina_local="$(curl -4 ifconfig.me)/32"
$ vault kv put kv/credentials-database db_username="user_root_db" db_password="senha_password" # não são os dados que foi gerado no banco 


# Ansible