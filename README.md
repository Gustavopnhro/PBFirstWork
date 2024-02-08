## PB COMPASS ATIVIDADE NÚMERO UM


<div align="center">
  <img src="/src/logo_uol_compass.png" width="340px">
</div>


#### AWS:
- ✅ Gerar chave pública para acesso ao ambiente;
- ✅ Criar uma instância EC2 com o sistema operacional Amazon Linux 2 (t3.small, 16 GB SSD);
- ✅ Gerar 1 Elastic IP e anexar à instância EC2;
- ✅ Liberar as portas de comunicação para acesso público

| Portas | Protocolo |
|:------:|-----------|
| 22     | TCP       |
| 111    | TCP/UDP   |
| 2049   | TCP/UDP   |
| 80     | TCP       |
| 443    | TCP       |

#### Linux
- ✅ Configurar o NFS;
- ✅ Criar um diretório dentro do filesystem do NFS com seu nome;
- ✅ Subir um apache no servidor;
- ✅ Criar um script que valide se o serviço está online e envie o resultado para o diretório do NFS;
- ✅ O script deve conter - Dara Hora + Nome do Serviço + Status + Mensagem Personalizada de Online ou Offline
- ✅ O script deve gerar dois arquivos de saída: 1 para o serviço e 1 para o serviço offline;
- ✅ Preparar a execução automatizada do script a cada 5 minutos;
- ✅ Fazer o versionamento da atividade;

### Hands-On 🔨

### Requisitos AWS:
#### 🔑 Gerar chave pública 🔑
1. Na seção de "Key Pair" ou "Par de chaves" clique em "Create key pair"

<div align="center">
  <img src="/src/step_by_step/key_pair01.png">
</div>

2. Quando o nova seção abrir insira os dados pertinentes para a configuração como nome da cahve a configuração .pem ou .ppk dependendo do tipo de acesso e por fim o tipo de chave RSA ou ED25519, em seguida clique em "Create key pair";

<div align="center">
  <img src="/src/step_by_step/key_pair02.png">
</div>


####  👷Configurando a EC2 👷
No módulo de EC2 da AWS temos diversas formas de iniciar uma instancia, mas vamos optar pela mais simples.

1. Na página inicial vamos clicar em "Launch Instance"

<div align="center">
  <img src="/src/step_by_step/ec2_01.png">
</div>

2. Logo em seguida vamos selecionar a segunda família como fora requerido nas configuraçoes inciais:

<div align="center">
  <img src="/src/step_by_step/ec2_image_family.png">
</div>


3. Após isso entraremos na página de configuração da EC2, no módulo de "Instance Type" vamos selecionar a máquina t3.small como requerida nas configurações iniciais.


<div align="center">
  <img src="/src/step_by_step/ec2_02.png">
</div>

4. No módulo de pares de chave vamos adicionar àquela criada na configuração de requisitos anterior a esta, no caso a "minhaNovaChave".     

<div align="center">
  <img src="/src/step_by_step/ec2_03.png">
</div>

5. No módulo de "configure storage" vamos colocar a quantidade requerida na atividade de 16gb no gp3 que é um SSD.

<div align="center">
  <img src="/src/step_by_step/ec2_04.png">
</div>

6. No módulo de "Network Settings" é onde vamos aplicar as regras de inbound e outbond

| Portas | Protocolo |
|:------:|-----------|
| 22     | TCP       |
| 111    | TCP/UDP   |
| 2049   | TCP/UDP   |
| 80     | TCP       |
| 443    | TCP       |

<div align="center">
  <img src="/src/step_by_step/ec2_05.png">
</div>

- Ao clicarmos em "Add security group rule" vamos adicionar uma regra de grupo de segurança para cada protocolo solicitado, lembrando que nos protocolos que são TCP/UDP vamos configurar duas regras.

6.1. Porta 22 TCP
<div align="center">
  <img src="/src/step_by_step/ec2_porta22_tcp.png">
</div>

6.2. Porta 80 TCP
<div align="center">
  <img src="/src/step_by_step/ec2_porta80_tcp.png">
</div>

6.3. Porta 111 TCP/UDP

<div align="center">
  <img src="/src/step_by_step/ec2_porta111_tcp.png">
</div>


<div align="center">
  <img src="/src/step_by_step/ec2_porta111_udp.png">
</div>

6.4. Porta 443
<div align="center">
  <img src="/src/step_by_step/ec2_porta443_tcp.png">
</div>

6.5. Porta 2049
<div align="center">
  <img src="/src/step_by_step/ec2_porta2049_tcp.png">
</div>

<div align="center">
  <img src="/src/step_by_step/ec2_porta2049_udp.png">
</div>

7. As configurações devem ficar exatamente assim e em seguida vamos clicar em "Launch Instance" quando o resumo da instância estiver assim:

<div align="center">
  <img src="/src/step_by_step/ec2_summary_01.png">
</div>


#### 📌 Criando Elastic IP 📌

Ainda no módulo de EC2 na lateral esquerda haverá um painel e na seção de "Network and Security" é possível encontrar o "Elastic Ip" assim como na imagem abaixo: 

<div align="center">
  <img src="/src/step_by_step/elastic_ip_screen.png">
</div>


1. Em seguida vamos criar em "Allocate Elastic IP address"

<div align="center">
  <img src="/src/step_by_step/elastic_ip_start_button.png">
</div>

2. Dentro da página nós vamos apenas ir até o final e clicar em "Allocate"


<div align="center">
  <img src="/src/step_by_step/elastic_ip_allocate_button.png">
</div>

3. Com o Elastic IP criado, clique em "Actions" em seguida "Associate Elastic Ip Address"

<div align="center">
  <img src="/src/step_by_step/elastic_ip_associate_button.png">
</div>

4. Após isso, selecione a instância criada no passo anterior e então vincule o elastic ip a ela clicando em "Associate"

<div align="center">
  <img src="/src/step_by_step/elastic_ip_associate_step.png">
</div>

6. Pronto! A partir desde momento quando verificarmos as configurações da nosa EC2 nosso elastic ip estará associado.

<div align="center">
  <img src="/src/step_by_step/final_ec2_summary.png">
</div>


### Requisitos Linux:
#### ⚡ Configurar EFS ⚡:

1. Vamos no módulo de EFS e então vamos clicar em "Create File System" como no exemplo abaixo:


<div align="center">
  <img src="/src/step_by_step/efs_01.png">
</div>


2. Uma janela nova vai surgir na tela permitindo que seja configurado o nome do EFS (opcional) e a VPC a que ela estará atribuída, vale atentar-se que a VPC deve sera mesma que a EC2 está configurada.

<div align="center">
  <img src="/src/step_by_step/efs_02.png">
</div>

3. Após o criar o EFS vamos clicar no seu ID para acessar as configuraçoes;

<div align="center">
  <img src="/src/step_by_step/efs_03.png">
</div>

4. Ao acessarmos o painel de configurações vamos clicar em "Access Points" para criar o ponto de conexão que as instâncias usarão;

<div align="center">
  <img src="/src/step_by_step/efs_04.png">
</div>

<div align="center">
  <img src="/src/step_by_step/efs_05.png">
</div>

5. Ao abrir a janela de configuração do Access Point vamos configurar o nome (opcional) e ir até o final da página


<div align="center">
  <img src="/src/step_by_step/efs_06.png">
</div>  

<div align="center">
  <img src="/src/step_by_step/efs_07.png">
</div>


6. Após a criação do ponto de acesso corretamente no EFS vamos verificar se na seção de "Network" se todas as nossas regras foram colocadas corretamente dentro da EFS através do botão "Manage"

<div align="center">
  <img src="/src/step_by_step/efs_08.png">
</div>


<div align="center">
  <img src="/src/step_by_step/efs_09.png">
</div>

7. Próximo passo é logar na nossa EC2 através da chave gerada nos passos inici  ais de configuração da AWS e então vamos executar o seguinte comando:

```bash
sudo yum update
sudo yum install amazon-efs-utils
sudo mkdir /mnt/efs
```


<div align="center">
  <img src="/src/step_by_step/efs_10.png">
</div>


<div align="center">
  <img src="/src/step_by_step/efs_11.png">
</div>

Obs: Caso os comandos inicialmente apontem permissão negada, use o "sudo" no início para executar os comandos como root

8. Montando o EFS na nossa máquina, para isso vamos precisar retornar à pagina do EFS e então copiar o DNS name:

<div align="center">
  <img src="/src/step_by_step/efs_12.png">
</div>

9. Em seguida vamos digitar o seguinte comando no terminal
```bash
sudo mount -t efs [DNS_Name_copiado] [local_de_montagem]
sudo mount -t efs fs-05462f6621439786d.efs.us-east-1.amazonaws.com /mnt/efs
 ```


10. Logo após vamos executar o comando para criar uma pasta dentro do EFS com nosso nome, como requerido anteriormente:

```bash
sudo mkdir /mnt/efs/SeuNome
```
 
<div align="center">
  <img src="/src/step_by_step/efs_13.png">
</div>


🌟 <b> EXTRA </b> 🌟
11. Para verificar se o diretórito foi montado corretamentena nossa máquina, vamos executar o comando:

```bash 
df -h #Esse comando lista todos os diretórios montados na instância
```
<div align="center">
  <img src="/src/step_by_step/efs_14.png">
</div>


### 🔌 Configurar Servidor Apache 🔌

Para configurarmos um servidor apache dentro deu uma instância primeiramente precisamos atualizar todas as dependências que o sistema possa ter:

1. Atualizando todas as eventuais dependências do sistemas;
```bash
sudo yum update -y
```

2. Instalando o apache;
```bash
sudo yum install httpd
```

3. Iniciando o serviço do sevidor apache;
```bash
sudo systemctl start httpd
```

4. Habilitando o apache para iniciar automaticamente após a execução da instância;
```bash
sudo systemctl enable httpd
```

5. Verificando a integridade do serviço do apache;
```bash
sudo systemctl status httpd
```
<div align="center">
  <img src="/src/step_by_step/apache_01.png">
</div>

É possível verificar através do "Active: active (running)" que o nosso serviço está saudável e funcionando.

6. Agora, se desejamos verificar a integridade do nosso serviço para além da CLI vamos retornar para a página da nossa instância EC2 criada anteriormente e copiar o Elastic IP que associamos a ela no nosso navegador:

<div align="center">
  <img src="/src/step_by_step/apache_02.png">
</div>

<div align="center">
  <img src="/src/step_by_step/apache_03.png">
</div>

A página acima é a página que precisa retornar para nós!

### ⚙️ Criando o Script de Validação do Serviço ⚙️

1. Escolher o diretório onde ficará salvo o nosso script, no caso desse laboratório será utilizado o diretório "status_apache":

```bash
mkdir status_apache
cd status_apache/
touch status_apache.sh
nano status_apache.sh
```

<div align="center">
  <img src="/src/step_by_step/script_01.png">
</div>


2. Em seguida escreva dentro do script os seguintes comandos:
```bash
#!/bin/bash
  
export TZ=America/Sao_Paulo
DATE=$(date '+%D-%M-%Y %H:%M:%S')
  
if systemctl is-active --quiet httpd; then
 		STATUS="Online"
  	MESSAGE="O Apache está online e rodando!"
  	FILENAME="apache_online.txt"
	echo "$DATE httpd $STATUS - $MESSAGE" >> /mnt/efs/GustavoPinheiro/status_online_output.txt
else
  	STATUS="Offline"
 		MESSAGE="O Apache está offline."
  	FILENAME="apache_offline.txt"
	echo "$DATE httpd $STATUS - $MESSAGE" >> /mnt/efs/GustavoPinheiro/status_offline_output.txt
fi

```

3. Mudar as permissões para que o script consiga ser executado

```bash
chmod +x status_apache.sh #Mudando as permissões para que o script consiga ser executado

sudo ./status_apache.sh #Executando o script
```
<div align="center">
  <img src="/src/step_by_step/script_02.png">
</div>

4. Verificando se o script está funcionando para o offline também:

<div align="center">
  <img src="/src/step_by_step/script_03.png">
</div>

### 🤖 Automatizando a verificação para de cada 5 minutos 🤖

1. Instalar o Cronie executando os comandos:
```bash
sudo yum update -y
sudo yum install cronie
```

2. Iniciar o cronie e habilitar ele para iniciar junto com a instância:
```bash
sudo systemctl start crond
sudo systemctl enable crond
```

3. Verificando se o serviço está funcionando:
```bash
sudo systemctl status crond
```

<div align="center">
  <img src="/src/step_by_step/cron_01.png">
</div>

4. Abrindo o arquivo de configuração do cron
```bash
sudo nano /etc/crontab
```

5. Edite o código, adicionando o nosso script criado anteriormente:

```bash
*/5 * * * * ec2-user sudo /home/ec2-user/status_apache/status_apache.sh 
```
E aperte ctrl+x, y e enter para salvar corretamente o arquivo


6. Para verificar se está tudo funcionando tranquilamente vamos executar os seguintes comandos:

```bash
cat /mnt/efs/GustavoPinheiro/status_online_output.txt
cat /mnt/efs/GustavoPinheiro/status_offline_output.txt
```

<div align="center">
  <img src="/src/step_by_step/cron_02.png">
</div>

Por fim temos o nosso script validando a cada 5 minutos como especificado no crontab.

### 🌟 Automatizando a montagem do EFS e inicialização do Apache 🌟

1. Vamos até o diretório de inicialização dos scripts

```bash
cd /etc/init.d
```

2. Criar um shell script um nome de sua escolha, o script neste diretório fará com que todas as vezes que a máquina for iniciada esse script seja executado

```bash
sudo nano init-system.sh
```

3. Dentro do "init-system.sh" copie o seguinte comando:

```bash
#!/bin/bash

sudo mount -t efs fs-05462f6621439786d.efs.us-east-1.amazonaws.com /mnt/efs
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl status httpd

```

4. Mude as permissões para transformar o .sh em um executável

```bash
sudo chmod +x init-system.sh
```

5. Dentro do init.d
```bash
sudo ln -s /etc/init.d/init-system.sh /etc/rc.d/rc3.d/S99init-system.sh
sudo reboot
```

6. Para verificarmos se o script funcionou corretamente, vamos utilizar o comando:

```bash
df -h #Verificar os diretórios que estão montados
```
<div align="center">
  <img src="/src/step_by_step/cron_03.png">
</div>


```bash
cat /mnt/efs/GustavoPinheiro/status_online_output.txt
cat /mnt/efs/GustavoPinheiro/status_offline_output.txt
```
Exemplo:
<div align="center">
  <img src="/src/step_by_step/cron_02.png">
</div>

### 🌟Automatizando a criação de uma instância usando Terraform🌟

#### Pré-requisitos
1. Ter a AWS CLI previamente configurada no seu terminal;
Obs: Documentação oficial disponível em:
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-quickstart.html

#### Instalando Terraform
No caso em questão vamos usar a versão 1.7.2 (a mais estável no momento atual).

Para consultar a instalação em outros sistemas operacionais consulte o site oficial: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

1. Atualizando todo o sistema
```bash
sudo apt update
```

2. Instalando o pacote que vai descompactar o arquivo baixado
```bash
sudo apt install unzip
```

3. Baixando o Terraform
```bash
wget https://releases.hashicorp.com/terraform/1.7.2/terraform_1.7.2_linux_amd64.zip
```

3. Descompactando o terraform
```bash
unzip terraform_1.7.2_linux_amd64.zip
```

4. Movendo o Terraform para o diretório de binários
```bash
sudo mv terraform /usr/local/bin/ 
```

5. Verificando se o Terraform está devidamente instalado
```bash
terraform version
```

<div align="center">
  <img src="/src/step_by_step/terraform_01.png">
</div>

#### Criando o arquivo de execução principal 
1. Criar o arquivo "main.tf"
```bash
nano main.tf
```

2. Em seguida copie o código disponível no main.tf do repositório:
```bash
provider "aws" {
  region = "us-east-1" 
}

resource "aws_security_group" "securityGroupByTerraform" {
  name        = "terraform-security-group"
  description = "Example of security group created by Terraform"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 111
    to_port     = 111
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 111
    to_port     = 111
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

      ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_eip" "createdByTerraform" {
  instance = aws_instance.createdByTerraform.id
}

resource "aws_instance" "createdByTerraform" {
  ami           = "ami-0cf10cdf9fcd62d37" 
  instance_type = "t3.small"
  key_name      = "minhaNovaChave"
  ebs_optimized = true

  vpc_security_group_ids = [aws_security_group.securityGroupByTerraform.id]
  

  root_block_device {
    delete_on_termination = true
  }

  tags = {
    "Name"       = ""
    "CostCenter" = ""
    "Project"    = ""
  }

  volume_tags = {
    "Name"       = ""
    "CostCenter" = ""
    "Project"    = ""
  }

  metadata_options {
    http_tokens             = "required"
    http_endpoint           = "enabled"
    http_put_response_hop_limit = 2
  }
}

resource "aws_eip_association" "createdByTerraform" {
  instance_id   = aws_instance.createdByTerraform.id
  allocation_id = aws_eip.createdByTerraform.id
}
```

Aperte Ctrl+X, Y e Enter para salvar

3. Compile o código
```bash
terraform init
```
<div align="center">
  <img src="/src/step_by_step/terraform_02.png">
</div>

4. Execute
```bash
terraform apply
```

<div align="center">
  <img src="/src/step_by_step/terraform_03.gif">
</div>

5. Verifique a criação dos recursos

- Security Group
<div align="center">
  <img src="/src/step_by_step/terraform_04.png">
</div>

- Instância e Elastic Ip
<div align="center">
  <img src="/src/step_by_step/terraform_05.png">
</div>


6. Para apagar toda a estrutura feita anteriormente basta digitar no console o comando:
```bash
terraform destroy
```

#
#
Agradeço desde já àqueles que chegaram até o final da leitura, espero de coraçao que este laboratório tenha ajudado a esclarecer melhor as ideias relacionadas aos assuntos! 😃
#

<div align="center">
  <img src="/src/logo_uol_compass.png" width="170px">
</div>
