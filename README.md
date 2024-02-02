## PB COMPASS ATIVIDADE NÚMERO UM


<div align="center">
  <img src="/src/logo_uol_compass.png" width="340px">
</div>



### Requisitos
- VPC previamente configurada com gateway para internet;

#### AWS:
- ✅ Gerar chave pública para acesso ao ambiente;
- ✅ Criar uma instância EC2 com o sistema operacional Amazon Linux 2 (t3.small, 16 GB SSD);
- Gerar 1 Elastic IP e anexar à instância EC2;
- ✅ Liberar as portas de comunicação para acesso público

| Portas | Protocolo |
|:------:|-----------|
| 22     | TCP       |
| 111    | TCP/UDP   |
| 2049   | TCP/UDP   |
| 80     | TCP       |
| 443    | TCP       |

#### Linux
- Configurar o NFS;
- Criar um diretório dentro do filesystem do NFS com seu nome;
- Subir um apache no servidor;
- Criar um script que valide se o serviço está online e envie o resultado para o diretório do NFS;
- O script deve conter - Dara Hora + Nome do Serviço + Status + Mensagem Personalizada de Online ou Offline
- O script deve gerar dois arquivos de saída: 1 para o serviço e 1 para o serviço offline;
- Preparar a execução automatizada do script a cada 5 minutos;
- ✅ Fazer o ve2rsionamento da atividade;

### Hands-On 🔨

#### Gerar chave pública
Na seção de "Key Pair" ou "Par de chaves" clique em "Create key pair"

<div align="center">
  <img src="/src/step_by_step/key_pair01.png">
</div>

Quando o nova seção abrir insira os dados pertinentes para a configuração como nome da cahve a configuração .pem ou .ppk dependendo do tipo de acesso e por fim o tipo de chave RSA ou ED25519, em seguida clique em "Create key pair";

<div align="center">
  <img src="/src/step_by_step/key_pair02.png">
</div>


### Configurando a EC2
No módulo de EC2 da AWS temos diversas formas de iniciar uma instancia, mas vamos optar pela mais simples.

Na página inicial vamos clicar em "Launch Instance"

<div align="center">
  <img src="/src/step_by_step/ec2_01.png">
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
| 111    | TCP       |
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

As configurações devem ficar exatamente assim