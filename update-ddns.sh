#!/bin/sh
# Pequeño script para actualizar el registro dinámico en ddns.net
# basado en las credenciales que aparecen en el panel (update client).
# Sustituye USER y PASS por los valores de tu cuenta.

# Opcionalmente lee un archivo .env en el directorio raíz para no hardcodear
# credenciales. El fichero `.env.example` incluido muestra el formato.
if [ -f ".env" ]; then
    # shellcheck disable=SC1091
    source .env
fi

: "${DDNS_USER:=5x6pghz}"          # usuario mostrado en el panel
: "${DDNS_PASS:?define DDNS_PASS en .env o en este script}"  # contraseña ddns.net
: "${DDNS_HOST:=clashroyale-gaca.ddns.net}"

# myip puede omitirse para que ddns.net detecte automáticamente la IP pública.
URL="https://${DDNS_USER}:${DDNS_PASS}@members.dyndns.org/nic/update?hostname=${DDNS_HOST}"

# Si prefieres proporcionar la IP manualmente, añade &myip=1.2.3.4

resp=$(curl -s "$URL")
echo "$(date) -> respuesta ddns: $resp"
