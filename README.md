**Proyecto:** Aplicación CRUD en PHP (Cartas Clash Royale)

La aplicación está dockerizada con un contenedor MariaDB y un contenedor PHP/Apache.
Utiliza Bootstrap 5 y una hoja de estilos propia (`src/style.css`) para darle una apariencia temática
inspirada en **Clash Royale**; se incluyen logotipos, fondos y colores del juego.

- **Cómo levantar (local con Docker):**

```
docker compose up --build
```

- Abre el navegador en http://localhost:80
  regístrate, inicia sesión y realiza altas/bajas/modificaciones.

- **Acceso remoto (proxy inverso):**
  Al desplegar en un servidor público puedes utilizar el servicio de proxy incluido en el
  `docker-compose` (servicio `proxy`), o montar tu propio Nginx/Apache en el host. En cualquier
  caso el esquema de nombres es:

  ```
  http://clashroyale-gca.ddns.net
  https://clashroyale-gca.ddns.net
  ```

  donde `clashroyale` es la temática y `gca` son las iniciales de Gabriel Calvo Aja.

  Antes de arrancar recuerda mantener actualizado el registro DDNS para que
  `clashroyale-gaca.ddns.net` siempre apunte a tu IP pública. Puedes actualizarlo
  manualmente desde el panel de `ddns.net`, usar el cliente que te provea tu
  router, o bien ejecutar el script `update-ddns.sh` que se incluye en este
  repositorio:

  ```bash
  chmod +x update-ddns.sh
  # edita el script y escribe tu contraseña junto al usuario 5x6pghz
  ./update-ddns.sh           # prueba manual
  ```
  Añade esta llamada a un `cron` cada pocos minutos para automatizarlo
  o, si prefieres evitar el crontab, arranca el servicio `ddns` definido en
  `docker-compose.yml`. Ese contenedor instala `curl` y lanza el script cada 5
  minutos por ti:

  ```bash
  docker compose up -d ddns        # o `docker compose up --build` para todo
  ```

  El servicio `ddns` se ejecutará en segundo plano junto con los demás
  contenedores; puedes consultar sus registros con `docker compose logs ddns`.

  ***Uso con el proxy interno de Docker:***
  1. Crea un directorio `certs` en la raíz del proyecto con las claves SSL.
     - Para pruebas puede generar un par autofirmado: `./generate-self-signed.sh`.
     - Para producción copia aquí el `server.crt` y `server.key` que te proporcione
       Let's Encrypt u otro CA.
  2. Levanta todos los contenedores:
     ```
     docker compose up --build
     ```
     El proxy escuchará en los puertos 80 y 443 del host y reenviará al contenedor `web`.
  3. Ajusta tu DNS dinámico (`clashroyale-gca.ddns.net`) para que apunte a la IP pública
     del servidor donde corres Docker. Si usas un router con cliente DDNS, configúralo allí.

  ***Uso con un proxy externo (ej. Nginx en el host):***
  - Coloca la configuración de ejemplo en `conf/nginx-proxy.conf` y adapta las rutas
    de certificados.
  - Asegúrate de que el bloque `server_name` coincida con `clashroyale-gca.ddns.net`.

  En ambos casos la aplicación estará disponible en los dos esquemas y el contenido del
  contenedor web ni siquiera necesita conocer el nombre de dominio (apache ve sólo
  `localhost`).

- **Notas de seguridad:**
  - Las contraseñas se almacenan como hash usando `password_hash()`.
  - No subas tokens ni claves privadas al repositorio. Revoca inmediatamente cualquier token o clave que hayas compartido públicamente.
