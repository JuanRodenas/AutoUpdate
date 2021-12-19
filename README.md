# AutoUpdate
Enviar mensaje de notificación a Telegram cuando un equipo se actualiza o tiene actualizaciones


# Enviar mensaje de notificación a Telegram cuando nos conectamos al ordenador por SSH

Para poder recibir los mensajes en el Telegram, debes obtener el Token y chat_id de tu bot de telegram, puedes solicitarlos aquí desde la App de Telegram:
- Bot token: https://t.me/botfather
- Chat_ID: https://t.me/myidbot

![alt text](https://github.com/JuanRodenas/NotifyTelegramSSH/blob/main/hellotelegram.png)

Empezamos a instalar el bot de inicio. Para que funcione necesita permisos, por lo que instalar en el usuario ROOT:
### Instalar los paquetes y actualizamos el sistema
~~~~
sudo apt update
sudo apt upgrade -y
sudo apt curl -y
~~~~

### Edita el script notifyTelegramssh.sh, para añadir tu token de bot, y tu chat_id, renombra el script elegido a hello.sh
Descargar el script [script notifyTelegramssh.sh](https://github.com/JuanRodenas/NotifyTelegramSSH/blob/main/notifyTelegramssh.sh)
Y modicamos lo siguiente:
~~~~
TOKEN_BOT="YOUR_TOKEN_BOT"
TOKEN_ID="YOUR_TOKEN_CHAT"
~~~~

### Asigna los permisos a+x
~~~~
chmod a+x /root/scripts/notifyTelegramssh.sh
~~~~

### Agregamos al final del archivo /etc/pam.d/sshd la línea pam
~~~~
# Notificacion acceso ssh al servidor
session required pam_exec.so /root/scripts/notifyTelegramssh.sh
~~~~

El funcionamiento es sencillo, en cada sesión iniciada por SSH, nos informará del usuario con el que se ha accedido, su IP de origen y la fecha/hora.
### Ready!
