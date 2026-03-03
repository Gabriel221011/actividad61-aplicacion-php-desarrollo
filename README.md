**Proyecto:** Aplicación CRUD en PHP (Cartas Clash Royale)

La aplicación está dockerizada con un contenedor MariaDB y un contenedor PHP/Apache.
Utiliza Bootstrap 5 y una hoja de estilos propia (`src/style.css`) para darle una apariencia temática
inspirada en **Clash Royale**; se incluyen logotipos, fondos y colores del juego.

- **Cómo levantar (local con Docker):**

```
docker compose up --build
```

- Abre el navegador en http://localhost:80 (o en tu nombre personalizado, por ejemplo
  http://clashroyale.local:80 —añade ese host en `/etc/hosts` apuntando a `127.0.0.1`),
  regístrate, inicia sesión y realiza altas/bajas/modificaciones.

- **Notas de seguridad:**
  - Las contraseñas se almacenan como hash usando `password_hash()`.
  - No subas tokens ni claves privadas al repositorio. Revoca inmediatamente cualquier token o clave que hayas compartido públicamente.
