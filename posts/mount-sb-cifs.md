# Cómo añadir StorageBox (Hetzner) como espacio adicional en Ubuntu VPS usando SMB/CIFS

2024-7-10

Estoy usando un VPS con [Hetzner](https://www.hetzner.com/), para varios proyectos como por ejemplo alojar mi blog.
Puesto que necesito mas espacio, he decidido contratar el servicio de [storagebox](https://www.hetzner.com/storage/storage-box/) para ampliar el espacio en servidor, montado como espacio adicional .

Los pasos para seguir.

## Instalar las dependencias

~~~sh
sudo apt install cifs-utils nfs-common 
linux-modules-extra-$(uname -r)
~~~

## Montar storagebox

Creamos el directorio donde vamos a montar lo.

~~~sh
sudo mkdir -p /mnt/pve/sb
~~~

Montamos con encriptación usando `seal`, ejecutando .

~~~sh
sudo mount.cifs -o seal,vers=3,uid=1000,gid=1000,user=uxxxxxx,pass=contraseña //uxxxxxx.your-storagebox.de/backup /mnt/pve/sb
~~~

Para no tener que ejecutar este ultimo comando cada vez que reiniciamos el servidor .
Usaremos `fstab` .

Primero creamos el archivo con las credenciales de noestra cuenta.

~~~sh
sudo nano storagebox-credentials.txt
~~~

Introduzca el nombre de usuario y la contraseña en el siguiente formato.

~~~sh
username=uxxxxxx
password=123456789
~~~

Despues le damos los permisos necesarios .

~~~sh
sudo chmod 0600 /etc/storagebox-credentials.txt
~~~

Editamos el `fstab` asi .

~~~sh
sudo nano /etc/fstab
~~~

Ponemos lo seguiente.

~~~sh
### Mount Storagebox Cifs
//uxxxxxx.your-storagebox.de/backup /mnt/pve/sb cifs seal,vers=3,iocharset=utf8,rw,credentials=/etc/storagebox-credentials.txt,uid=1000,gid=1000,file_mode=0660,dir_mode=0770 0 0
~~~

