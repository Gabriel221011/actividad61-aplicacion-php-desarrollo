#!/bin/bash
# script para generar un certificado autofirmado rápido para pruebas locales
# utiliza los hosts indicados en el virtualhost

DOMAIN=clashroyale-gca.ddns.net
OUT_DIR=certs
mkdir -p "$OUT_DIR"/private

openssl req -x509 -nodes -days 365 \
    -subj "/CN=$DOMAIN" \
    -newkey rsa:2048 \
    -keyout "$OUT_DIR/private/server.key" \
    -out "$OUT_DIR/server.crt"

echo "Certificado y clave generados en $OUT_DIR (válidos por 1 año)."