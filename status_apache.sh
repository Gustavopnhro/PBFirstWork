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