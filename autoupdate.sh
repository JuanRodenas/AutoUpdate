#! /bin/bash
# Script de Juan Rodenas Sánchez
# Nos colocamos en el directorio de nuestro usuario

# Buscamos y actualizamos sistema
sudo apt update && sudo apt upgrade -y > /dev/null 2>&1
# Descarga e instala las últimas versiones de paquetes y realiza la actualización pasando a la próxima versión
sudo apt-get dist-upgrade -y && sudo apt-get full-upgrade -y > /dev/null 2>&1
# Elimino software y librerias innecesarias
sudo apt-get -y autoremove && sudo apt clean > /dev/null 2>&1

# requeriments:
TOKEN="YOUR_TOKEN_BOT"
ID="YOUR_TOKEN_CHAT"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"
DNS="1.1.1.1"
servidor=$(hostname)
MSG="\U1F4BE nasacloud actualizada \U2139"
IP="192.168.1.10"
PUBLIC_IP=$(curl http://checkip.amazonaws.com)
mensaje="Se ha actualizado el servidor $servidor \U1F504"

# Envío del mensaje
/usr/bin/ping -c2 $DNS > /dev/null 2>&1
if [ $? -ne 0 ]
then
        exit 0
else
        curl -s -X POST $URL \
        -d chat_id=$ID \
        -d parse_mode=HTML \
        -d text="$(printf "$MSG<code>\n\t\t- Host: $servidor\n\t\t- IP: $IP\n\t\t- IP public: $PUBLIC_IP\n\t\t- mensaje: $mensaje</code>")" \
                > /dev/null 2>&1
        exit 0
fi
