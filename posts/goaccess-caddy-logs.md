# Inspeccionar los registros de Caddy con GoAccess

2025-1-12

## Requerimientos necesarios

- **Servidor** (en mi caso Ubuntu 24.04 LTS)
- **Caddy** [instalar](https://caddyserver.com/docs/install#debian-ubuntu-raspbian)
- [GoAccess](https://goaccess.io/) para visualizar los registros

## Que es Goaccess?

[GoAccess](https://goaccess.io/) es un analizador de registros web en tiempo real de código abierto y un visor interactivo que se ejecuta en un terminal en sistemas *nix o a través de su navegador.

## Instalar goaccess en Ubuntu 24.04

~~~sh
curl -1sLf  https://deb.goaccess.io/gnugpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/goaccess.gpg
echo "deb [signed-by=/usr/share/keyrings/goaccess.gpg arch=$(dpkg --print-architecture)] https://deb.goaccess.io/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/goaccess.list
sudo apt update
sudo apt install goaccess
~~~

## Instalar Caddy transform-encoder modulo

~~~sh
sudo caddy add-package github.com/caddyserver/transform-encoder
~~~

## Caddyfile

Añadir en `/etc/caddy/Caddyfile`

~~~sh
# Use logging
(logging) {
  log {
      output file /var/log/caddy/access.log
      format transform `{request>remote_ip} - {user_id} [{ts}] "{request>method} {request>uri} {request>proto}" {status} {size} "{request>headers>Referer>[0]}" "{request>headers>User-Agent>[0]}"` {
      time_format "02/Jan/2006:15:04:05 -0700"
      }
  }
~~~

Yo he decido usar el modo "combinado" [Apache Combined Log Format](https://github.com/caddyserver/transform-encoder?tab=readme-ov-file#apache-combined-log-format-example).

## Como visualizar los registros con goaccess?

### Desde la terminal

~~~sh
sudo goaccess /var/log/caddy/access.log --log-format=COMBINED
~~~

![](/public/images/IMG_20250112_094004.jpg)

### Desde Web UI

Podemos crear un subdominio para acceder desde el navegador .

Exemplo Caddyfile:

~~~sh
logs.[domainname] {
  import logging
  tls [address]@[domainname]
  encode gzip zstd
  file_server
  root * /var/www/[domainname]/logs
}
~~~ 

Creamos systemd service para goaccess:

~~~sh
sudo systemctl edit --full --force goaccess.service
~~~

Añadimos las seguientes lineas:

~~~sh
[Unit]
Description=GoAccess Live Log Analyzer
After=caddy.service

[Service]
Type=exec
ExecStart=/usr/bin/goaccess /var/log/caddy/access.log -o /var/www/logs.[domainame]/logs/index.html --log-format=COMBINED --html-prefs='{"theme":"darkGray"}'
RestartSec=300
Restart=always

[Install]
WantedBy=multi-user.target
~~~

Iniciar el servicio:

~~~sh
sudo systemctl start goaccess
~~~

![](/public/images/IMG_20250112_100811.jpg)

![](/public/images/IMG_20250112_100827.jpg)
