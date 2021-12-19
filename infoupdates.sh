#!/bin/bash
# date: 07/07/2021
# dev: Juan Rodenas
# funcion: Notificacion acceso ssh
# Buscamos actualizaciones
sudo apt-get update > /dev/null 2>&1

# requeriments:
TOKEN="YOUR_TOKEN_BOT"
ID="YOUR_TOKEN_CHAT"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"
DNS="1.1.1.1"
servidor=$(hostname)
PUBLIC_IP=$(curl -s -X GET http://checkip.amazonaws.com)
cpu=$(cat /sys/class/thermal/thermal_zone0/temp)
actualizaciones=$(/usr/bin/apt-get -s -q -u upgrade | grep -v '\.\.\.' | grep -v ':' | grep -v 'Inst ' | grep -v 'Conf ')
mensaje="Se encuentran disponibles las siguientes actualizaciones para el servidor $servidor:\n\n$actualizaciones"

# Envío del mensaje
/usr/bin/ping -c2 $DNS > /dev/null 2>&1
if [ $? -ne 0 ]
then
        exit 0
else
        curl -s -X POST $URL \
        -d chat_id=$ID \
        -d parse_mode=HTML \
        -d text="$(printf "$MSG\n\t\t\U2B50 Host: <code>$servidor</code>\t\U2B50\n\t\t- CPU temp: <code>$((cpu/1000))°</code>\n\t\t- IP pública: <code>$PUBLIC_IP</code>\n\t\t- Mensaje: <code>$mensaje</code>")" \
> /dev/null 2>&1
        exit 0
fi
