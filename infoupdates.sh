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
uptime=$(uptime -p)
PUBLIC_IP=$(curl -s -X GET http://checkip.amazonaws.com)
cpu=$(cat /sys/class/thermal/thermal_zone0/temp)
FREERAM=$(free -mh | grep Mem | awk '{print $4}')
USEDRAM=$(free -mh | grep Mem | awk '{print $3}')
actualizaciones=$(/usr/bin/apt-get -s -q -u upgrade | grep -v '\.\.\.' | grep -v ':' | grep -v 'Inst ' | grep -v 'Conf ')
mensaje="\U267B Actualizaciones disponibles para el servidor $servidor:\n\n$actualizaciones"
MSG="\U1F353 $servidor informa \U1F6A8"

# Envío del mensaje
/usr/bin/ping -c2 $DNS > /dev/null 2>&1
if [ $? -ne 0 ]
then
        exit 0
else
        curl -s -X POST $URL \
        -d chat_id=$ID \
        -d parse_mode=HTML \
        -d text="$(printf "$MSG<code>\n\t\t- Host: $servidor\n\t\t- Uptime: $UPTIME\n\t\t- CPU temp: $((cpu/1000))°\n\t\t- RAM: Used $USEDRAM/ Free $FREERAM\n\t\t- IP pública: $PUBLIC_IP\n\t\t- Mensaje: $mensaje</code>")" \
> /dev/null 2>&1
        exit 0
fi
