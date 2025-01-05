# Configurar VPS con Hetzner

2024-12-21

Esta es una guía completa para configurar un Servidor Privado Virtual (VPS) en [Hetzner Cloud](https://www.hetzner.com/cloud)
. 

El post cubre todo, desde la creación de un servidor, la configuración del acceso SSH, la configuración de cortafuegos, la gestión de usuarios y tambien aplicar medidas para garantizar la seguridad y estabilidad del servidor .

> **⚠️ Aviso**
>
> Para esta guia usaremos un servidor con Ubuntu 24.04 LTS.

El primer paso es ir en Hetzner Cloud panel .

![/public/images/9566fcd5.jpeg](/public/images/9566fcd5.jpeg)

- Crear nuevo proecto .
- Crear servidor .
- Selecionar los componentes mas apropiados para noestra necesidad .
    - Ubucacion
    - Sistema Operativo
    - Núcleos y tipo de CPU
    - RAM
    - Almacenamiento
    - Añadir SSH

## Configurar SSH

### Generar una clave ssh desde la terminal

Ejecutar estos dos comandos y siga los pasos . Es recomentable asegurar las llaves con una contraseña robusta .

~~~sh
cd ~/.ssh
ssh-keygen -t ed25519
~~~

### Anadir SSH llave publica en el Cloud panel 


![](/public/images/c359eccc.jpeg)

Para ver la llave publica que hemos creado ejecutamos el siguente comando .

~~~sh
cat ~/.ssh/ed25519.pub
~~~

Copiamos el contenido de la clave publica,  añadiremos y guardamos .

### Conectamos al servidor via SSH

~~~sh
ssh root@<server-ip>
~~~

Nos va a pedir la contraseña para la llave que hemos creado .

### Actualizar el servidor

Ejecutamos siguentes comandos .

~~~sh
apt update && apt upgrade -y
~~~

## Medidas de seguridad

En este apartado trataremos de configurar las medidas de seguridad para que el servidor sea lo mas seguro posible .

### Asegurar acceso al servidor con SSH

Para ello, modificanos el archivo de configuración del servicio con un editor de texto de su elección (`nano` utilizado en este ejemplo):

~~~sh
nano /etc/ssh/sshd_config
~~~

### Desactivar acceso con root

Encontramos la linia "**PermitRootLogin**" y cambiamos a "**no**" .

### Desactivar inicio con contraseña

Encontramos la linia  "**PasswordAuthentication**" y cambiamos a "**no**" . 
Tambien como en noestro caso vamos a utilizar llave publica para conectar, tenemos que buscar la linia "**PubkeyAuthentication**" y cambiar la a "**yes**" .

### Cambiar el puerto por defecto de SSH

Una de las primeras cosas que debe hacer en su servidor es configurar el puerto de escucha del servicio SSH. Por defecto está configurado en el puerto 22, por lo que la mayoria de los intentos por parte de bots se dirigirán a este puerto. Modificar esta configuración utilizando un puerto diferente es una medida sencilla para endurecer el servidor contra ataques automatizados.

Encuentra la línea donde "**Port 22**", sustituya el número 22 por el número de puerto de su elección y guardamos .

> **⚠️ Aviso**
>
> No introduzca un número de puerto ya utilizado en su sistema. Para mayor seguridad, utilice un número comprendido entre 49152 y 65535.

Para comprobar si un puerto esta ocupado por otro servicio puede usar el seguiente comando .

~~~sh
netstat -tulpn | grep LISTEN
~~~

Al final debera quedar de esta manera .

~~~sh
Port 65535
PermitRootLogin no
PubkeyAuthentication yes
PasswordAuthentication no
~~~

### Reiniciar el servicio
Ahora tenemos que reiniciar el servicio, pero antes des esto en noestro caso utilizamos un servidor con Ubuntu 24.04 lts y necesitaremos un paso adicional .
Desde la version de Ubuntu 23.04 ssh es ahora gestionado por el archivo `ssh.socket`. Por esto si ahora reiniciamos el servicio ssh quedara en escucha de puerto 22 sin cambiarse . Para poder solucionar esto debemos que editar un archivo mas .

Ejecutamos el seguiente comando .

~~~sh
nano /lib/systemd/system/ssh.socket
~~~

Buscamos las lineas donde `Listenstream` y remplezamos 22 por el puerto elegido (en noestro caso hemos elegido puerto 65535) y guardamos .

Debera quedar asi:

~~~sh
[Socket]
ListenStream=0.0.0.0:65535
ListenStream=[::]:65535
BindIPv6Only=ipv6-only
Accept=no
FreeBind=yes
~~~

Una vez echo esto ya podemos reiniciar el servicio.

~~~sh
systemctl daemon-reload
systemctl restart ssh.socket
systemctl restart ssh.service
~~~

Para comprobar si se han aplicado los cambios corectamente ejecuta :

~~~sh
systemctl status ssh | grep 'listening'
~~~

~~~sh
Dec 21 08:38:32 ubuntu-8gb-fsn1-1 sshd[764617]: Server listening on 0.0.0.0 port 65535.
Dec 21 08:38:32 ubuntu-8gb-fsn1-1 sshd[764617]: Server listening on :: port 65535.
~~~

### Crear un usuario no root con privilegios sudo

Debemos de sustituir `<username>` con el nombre del usuario que vamos a crear .

~~~sh
adduser <username>
usermod -aG sudo <username>
~~~

Creamos el directorio para ssh y el archivo authorized_keys donde vamos a copiar noestra clave publica .

~~~sh
mkdir ~/.ssh
nano ~/.ssh/authorized_keys
~~~

A partir de ahora vamos a conectarnos con el usuario que hemos creado y dejaremos de hacer lo con "root" .

Para aceder al servidor, ejecutamos .

~~~sh
ssh -p 65535 <username>@<server-ip>
~~~

### Configurar cortafuegos

Utilizaremos "ufw" para gestionar las reglas del cortafuegos.

Ahora bien, denegaremos todo el tráfico de red entrante a menos que esté específicamente permitido por otras reglas. Esto es fundamental para asegurar su servidor permitiendo sólo el tráfico que usted permita explícitamente. 

Necesita ejecutar este comando:

~~~sh
sudo ufw default deny incoming
~~~

A continuación, permitiremos todo el tráfico de red saliente. Esto permite al servidor comunicarse con otros servidores o servicios sin restricciones. 

Ejecute este comando:

~~~sh
sudo ufw default allow outgoing
~~~

Ahora, tenemos que permitir nuestro puerto SSH para poder iniciar sesión en nuestro servidor .

~~~sh
sudo ufw allow 65535/tcp
~~~

Desactivar default port 22 de las reglas de Ufw

~~~sh
sudo ufw delete allow OpenSSH
~~~

Por ultimo, iniciamos el cortafuegos con las reglas que hemos creado .

~~~sh
sudo ufw enable
~~~

Para ver las reglas que hemos creado .

~~~sh
sudo ufw status verbose
~~~

~~~sh
Status: active
Logging: on (low)
Default: deny (incoming), allow (outgoing), deny (routed)
New profiles: skip

To                         Action      From
--                         ------      ----
65535/tcp                  ALLOW IN    Anywhere
65535/tcp (v6)             ALLOW IN    Anywhere (v6)
~~~

### Instalar y configurar Fail2ban

Para proteger el servidor de intentos de inicio de session utilizando SSH con ataques de fuerza bruta, utilizaremos Fail2ban el que baneará las IPs que muestren signos o intentos maliciosos.

Ejecutamos:

~~~sh
sudo apt install fail2ban
~~~

Ahora configuramos las reglas .

~~~sh
sudo nano /etc/fail2ban/jail.local
~~~

Ponemos el seguiente contenido .

~~~sh
[DEFAULT]
bantime = 1d
findtime = 15m
maxretry = 3
backend = auto
banaction = ufw

[sshd]
enabled = true
port    = 65535
~~~

Una vez configurado el archivo, tenemos que habilitar el servicio para que ejecute cada vez que reiniciamos el servidor .

~~~sh
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
~~~

Ahora cada vez que se detecta 3 intentos maliciosos en rango de 15 minutos, el IP del atacante sera bloqueda por 1 dia . Puede jugar con los perimetros y adaptarlos como quieren .

Para ver los IP que se han bloqueado .

~~~sh
sudo fail2ban-client status sshd
~~~

### Configurar actualizaciones de seguridad automaticas .

~~~sh
sudo apt install unattended-upgrades -y
sudo dpkg-reconfigure unattended-upgrades
~~~

### Copias de seguridad

#### Desde Hetzner cloud panel.

- [Snapshots](https://docs.hetzner.com/cloud/servers/backups-snapshots/overview/) - Copia del disco de un servidor que se crea manualmente. Los Snapshots pueden utilizarse para capturar el estado actual del disco del servidor, y se guardan hasta que decida eliminarlas. Sin borrar y actualizar se automáticamente. Tienen un coste de 0,0119€ por GB .

- [Backups](https://docs.hetzner.com/cloud/servers/getting-started/enabling-backups/) - Hetzner permite programar copias de seguridad diarias de tus servidores en la nube pagando el 20% del precio del servidor .

- Copias de seguridad en un almacenamiento externo como (AWS S3, Wasabi, Backblaze, etc). Tambien tiene su coste, segun los datos . 

## Buenas practicas

- Actualizar el servidor periodicamente .
- Revise regularmente los registros de su sistema.
- Permitir en el cortafuego solo los puertos extrictamente necesarios .
- Hacer copias de seguridad.
- Revisar periodicamente el espacio usado en el servidor y su rendimiento.
