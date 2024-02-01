## PB COMPASS ATIVIDADE NÚMERO UM


<div align="center">
  <img src="/src/logo_uol_compass.png" width="340px">
</div>



### Requisitos

#### AWS:
- Gerar chave pública para acesso ao ambiente;
- Criar uma instância EC2 com o sistema operacional Amazon Linux 2 (t3.small, 16 GB SSD);
- Gerar 1 Elastic IP e anexar à instância EC2;
- Liberar as portas de comunicação para acesso público

| Portas | Protocolo |
|:------:|-----------|
| 22     | TCP       |
| 111    | TCP       |
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
- Fazer o versionamento da atividade;