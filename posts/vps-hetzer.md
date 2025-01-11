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

Para ver la llave publica que hemos creado ejecutamos el siguente comando:

~~~sh
cat ~/.ssh/ed25519.pub
~~~

Copiamos el contenido de la clave publica, añadimos y guardamos .

### Conectamos al servidor via SSH

~~~sh
ssh root@<server-ip>
~~~

Nos va a pedir la contraseña para la llave que hemos creado .

### Actualizar el servidor

Ejecutamos siguentes comandos:

~~~sh
apt update && apt upgrade
~~~

## Medidas de seguridad

En este apartado trataremos de configurar las medidas de seguridad para que el servidor sea lo mas seguro posible:

### Asegurar acceso al servidor con SSH

Para ello, modificamos el archivo de configuración del servicio con un editor de texto de su elección (`nano` utilizado en este ejemplo):

~~~sh
nano /etc/ssh/sshd_config
~~~

### Desactivar acceso con root

Encontramos la linia "**PermitRootLogin**" y cambiamos a "**no**" .

### Desactivar inicio con contraseña

Encontramos la linia  "**PasswordAuthentication**" y cambiamos a "**no**" . 
Tambien como en noestro caso vamos a utilizar llave publica para conectar, tenemos que buscar la linia "**PubkeyAuthentication**" y cambiar la a "**yes**" .

### Reiniciar el servicio SSH

~~~sh
systemctl daemon-reload
systemctl restart ssh.service
~~~

### Crear un usuario no root con privilegios sudo

Debemos de sustituir `<username>` con el nombre del usuario que vamos a crear .

~~~sh
adduser <username>
usermod -aG sudo <username>
~~~

Creamos el directorio para ssh en el `$HOME` del nuevo usuario y el archivo `authorized_keys` donde vamos a copiar noestra clave publica .

~~~sh
su -l <username>
mkdir ~/.ssh
nano ~/.ssh/authorized_keys
~~~

A partir de ahora vamos a conectarnos con el usuario que hemos creado y dejaremos de hacer lo con "root" .

Para aceder al servidor, ejecutamos.

~~~sh
ssh <username>@<server-ip>
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

Permitir el acceso por SSH, puerto (22):

~~~sh
sudo ufw allow “OpenSSH”
~~~

Por ultimo, iniciamos el cortafuegos con las reglas que hemos creado .

~~~sh
sudo ufw enable
~~~

Para ver las reglas que hemos creado:

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
OpenSSH/tcp                ALLOW IN    Anywhere
OpenSSH/tcp (v6)           ALLOW IN    Anywhere (v6)
~~~

### Instalar y configurar Fail2ban

Para proteger el servidor de intentos de inicio de session utilizando SSH con ataques de fuerza bruta, utilizaremos Fail2ban el que baneará las IPs que muestren signos o intentos maliciosos.

Ejecutamos:

~~~sh
sudo apt install fail2ban
~~~

Ahora configuramos las reglas:

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
port    = ssh
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
