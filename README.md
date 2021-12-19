# Enviar mensaje de notificación a Telegram cuando nos conectamos al ordenador por SSH

Para poder recibir los mensajes en el Telegram, debes obtener el Token y chat_id de tu bot de telegram, puedes solicitarlos aquí desde la App de Telegram:
- Bot token: https://t.me/botfather
- Chat_ID: https://t.me/myidbot

![alt text](https://github.com/JuanRodenas/AutoUpdate/blob/main/hellotelegram.png)

Empezamos a instalar el bot de inicio. Para que funcione necesita permisos, por lo que instalar en el usuario ROOT:
### Instalar los paquetes y actualizamos el sistema
~~~~
sudo apt update
sudo apt upgrade -y
sudo apt curl -y
~~~~

### Edita el script infoupdates.sh, para añadir tu token de bot, y tu chat_id
Descargar el script [script infoupdates.sh](https://github.com/JuanRodenas/AutoUpdate/blob/main/infoupdates.sh)
Y modicamos lo siguiente:
~~~~
TOKEN_BOT="YOUR_TOKEN_BOT"
TOKEN_ID="YOUR_TOKEN_CHAT"
~~~~

### Edita el script autoupdate.sh, para añadir tu token de bot, y tu chat_id
Descargar el script [script autoupdate.sh](https://github.com/JuanRodenas/AutoUpdate/blob/main/autoupdate.sh)
Y modicamos lo siguiente:
~~~~
TOKEN_BOT="YOUR_TOKEN_BOT"
TOKEN_ID="YOUR_TOKEN_CHAT"
~~~~

### Asigna los permisos a+x
~~~~
chmod a+x /root/scripts/infoupdates.sh
chmod a+x /root/scripts/autoupdate.sh
~~~~

### Agregamos al cron las siguientes lineas para que se ejecuten
Hemos realizado que cada día se actualice
~~~~
00 23 * * * /root/scripts/infoupdates.sh >/dev/null 2>&1
30 23 * * * /root/scripts/autoupdate.sh >/dev/null 2>&1
00 04 * * * /sbin/shutdown -r +5
~~~~

El funcionamiento es sencillo, cada día se actualice y nos informará de las actualizaciones.
### Ready!
