#!/bin/bash 
# La IP al que queremos hacer ping
SERVER=1.1.1.1 

# Enviar solamente 2 pings, y enviar la salida a /dev/null
ping -c2 ${SERVER} > /dev/null 2>&1 & 

# Si el código de respuesta del ping ($?) no es 0 (significará que hay error)
if [ $? != 0 ] then 

# Reiniciar el servidor
sudo shutdown -r +5
fi
