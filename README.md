## PB COMPASS ATIVIDADE NÚMERO UM


<div align="center">
  <img src="/src/logo_uol_compass.png" width="340px">
</div>



### Requisitos
- VPC previamente configurada com gateway para internet;

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
- Preparar a execução automatizada do script a cada 5 minutos;
- ✅ Fazer o versionamento da atividade;

### Hands-On 🔨

### Requisitos AWS:
#### Gerar chave pública
Na seção de "Key Pair" ou "Par de chaves" clique em "Create key pair"

<div align="center">
  <img src="/src/step_by_step/key_pair01.png">
</div>

Quando o nova seção abrir insira os dados pertinentes para a configuração como nome da cahve a configuração .pem ou .ppk dependendo do tipo de acesso e por fim o tipo de chave RSA ou ED25519, em seguida clique em "Create key pair";

<div align="center">
  <img src="/src/step_by_step/key_pair02.png">
</div>


#### Configurando a EC2
No módulo de EC2 da AWS temos diversas formas de iniciar uma instancia, mas vamos optar pela mais simples.

Na página inicial vamos clicar em "Launch Instance"

<div align="center">
  <img src="/src/step_by_step/ec2_01.png">
</div>

Logo em seguida vamos selecionar a segunda família como fora requerido nas configuraçoes inciais:

<div align="center">
  <img src="/src/step_by_step/ec2_image_family.png">
</div>


Após isso entraremos na página de configuração da EC2, no módulo de "Instance Type" vamos selecionar a máquina t3.small como requerida nas configurações iniciais.


<div align="center">
  <img src="/src/step_by_step/ec2_02.png">
</div>

No módulo de pares de chave vamos adicionar àquela criada na configuração de requisitos anterior a esta, no caso a "minhaNovaChave".     

<div align="center">
  <img src="/src/step_by_step/ec2_03.png">
</div>

No módulo de "configure storage" vamos colocar a quantidade requerida na atividade de 16gb no gp3 que é um SSD.

<div align="center">
  <img src="/src/step_by_step/ec2_04.png">
</div>

No módulo de "Network Settings" é onde vamos aplicar as regras de inbound e outbond

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

Ao clicarmos em "Add security group rule" vamos adicionar uma regra de grupo de segurança para cada protocolo solicitado, lembrando que nos protocolos que são TCP/UDP vamos configurar duas regras.

- Porta 22 TCP
<div align="center">
  <img src="/src/step_by_step/ec2_porta22_tcp.png">
</div>

- Porta 80 TCP
<div align="center">
  <img src="/src/step_by_step/ec2_porta80_tcp.png">
</div>

- Porta 111 TCP/UDP

<div align="center">
  <img src="/src/step_by_step/ec2_porta111_tcp.png">
</div>


<div align="center">
  <img src="/src/step_by_step/ec2_porta111_udp.png">
</div>

- Porta 443
<div align="center">
  <img src="/src/step_by_step/ec2_porta443_tcp.png">
</div>

- Porta 2049
<div align="center">
  <img src="/src/step_by_step/ec2_porta2049_tcp.png">
</div>

<div align="center">
  <img src="/src/step_by_step/ec2_porta2049_udp.png">
</div>

As configurações devem ficar exatamente assim e em seguida vamos clicar em "Launch Instance" quando o resumo da instância estiver assim:

<div align="center">
  <img src="/src/step_by_step/ec2_summary_01.png">
</div>


#### Criando Elastic IP

Ainda no módulo de EC2 na lateral esquerda haverá um painel e na seção de "Network and Security" é possível encontrar o "Elastic Ip" assim como na imagem abaixo: 

<div align="center">
  <img src="/src/step_by_step/elastic_ip_screen.png">
</div>


Em seguida vamos criar em "Allocate Elastic IP address"

<div align="center">
  <img src="/src/step_by_step/elastic_ip_start_button.png">
</div>

Dentro da página nós vamos apenas ir até o final e clicar em "Allocate"


<div align="center">
  <img src="/src/step_by_step/elastic_ip_allocate_button.png">
</div>

Com o Elastic IP criado, clique em "Actions" em seguida "Associate Elastic Ip Address"

<div align="center">
  <img src="/src/step_by_step/elastic_ip_associate_button.png">
</div>

Após isso, selecione a instância criada no passo anterior e então vincule o elastic ip a ela clicando em "Associate"

<div align="center">
  <img src="/src/step_by_step/elastic_ip_associate_step.png">
</div>

Pronto! A partir desde momento quando verificarmos as configurações da nosa EC2 nosso elastic ip estará associado.

<div align="center">
  <img src="/src/step_by_step/final_ec2_summary.png">
</div>


### Requisitos Linux:
#### Configurar EFS:

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

7. Próximo passo é logar na nossa EC2 através da chave gerada nos passos iniciais de configuração da AWS e então vamos executar o seguinte comando:

```bash
yum -y install amazon-efs-utils
mkdir /mnt/efs
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


[EXTRA]
11. Para verificar se o diretórito foi montado corretamente na nossa máquina, vamos executar o comando:

```bash 
dh -f #Esse comando lista todos os diretórios montados na instância
```
<div align="center">
  <img src="/src/step_by_step/efs_14.png">
</div>


### Configurar Servidor Apache

1. Para configurarmos um servidor apache dentro deu uma instância primeiramente precisamos atualizar todas as dependências que o sistema possa ter:

- Atualizando todas as eventuais dependências do sistemas;
```bash
sudo yum update -y
```

- Instalando o apache;
```bash
sudo yum install httpd
```

- Iniciando o serviço do sevidor apache;
```bash
sudo systemctl start httpd
```

- Habilitando o apache para iniciar automaticamente após a execução da instância;
```bash
sudo systemctl enable httpd
```

- Verificando a integridade do serviço do apache;
```bash
sudo systemctl status httpd
```
<div align="center">
  <img src="/src/step_by_step/apache_01.png">
</div>

É possível verificar através do "Active: active (running)" que o nosso serviço está saudável e funcionando.

2. Agora, se desejamos verificar a integridade do nosso serviço para além da CLI vamos retornar para a página da nossa instância EC2 criada anteriormente e copiar o Elastic IP que associamos a ela no nosso navegador:

<div align="center">
  <img src="/src/step_by_step/apache_02.png">
</div>

<div align="center">
  <img src="/src/step_by_step/apache_03.png">
</div>

Essa é a página que precisa retornar para nós!

### Criando o Script de Validação do Serviço

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
else
  	STATUS="Offline"
 		MESSAGE="O Apache está offline."
  	FILENAME="apache_offline.txt"
fi

echo "$DATE httpd $STATUS - $MESSAGE" >> /mnt/efs/GustavoPinheiro/status_output.txt
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

### Automatizando a verificação para de cada 5 minutos

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
*/5 * * * * ec2-user sudo /home/ec2-user/status_apache/status_apache.sh >> /mnt/efs/GustavoPinheiro/status_output.txt 2>&1
```


