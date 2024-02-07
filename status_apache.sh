#!/bin/bash
  
export TZ=America/Sao_Paulo
DATE=$(date '+%D-%M-%Y %H:%M:%S')
  
if systemctl is-active --quiet httpd; then
 		STATUS="Online"
  	MESSAGE="O Apache está online e rodando!"
  	FILENAME="apache_online.txt"
	echo "$DATE httpd $STATUS - $MESSAGE" >> /mnt/efs/GustavoPinheiro/status_offline_output.txt
else
  	STATUS="Offline"
 		MESSAGE="O Apache está offline."
  	FILENAME="apache_offline.txt"
	echo "$DATE httpd $STATUS - $MESSAGE" >> /mnt/efs/GustavoPinheiro/status_online_output.txt

fi
