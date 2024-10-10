#!/data/data/com.termux/files/usr/bin/bash

# Obtener el IMEI del dispositivo
# En algunos dispositivos, este comando puede no funcionar debido a restricciones de Android
imei=$(service call iphonesubinfo 1 | awk -F "'" '{print $2}' | tr -d '[:space:]')

# Reemplaza con la URL de tu servidor ngrok
ngrok_server="https://9493-186-166-142-157.ngrok-free.app"

if [ -z "$imei" ]; then
    echo "No se pudo obtener el IMEI"
    exit 1
fi

# Enviar el IMEI a tu servidor
response=$(curl -X POST -d "imei=$imei" $ngrok_server)

echo "Respuesta del servidor: $response"
