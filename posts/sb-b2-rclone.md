# Sincronizar mi storagebox con backblaze B2 usando rclone

2024-7-14

> **💡Aviso** 
>
> `/mnt/pve/sb` es el directorio donde tengo montado storagebox en mi servidor y estoy usando como espacio adicional para hacer copias de seguridad, y nube para guardar algunos archivos.

Ver mi [post](https://blog.ivaylokuzev.eu/posts/mount-sb-cifs/) sobre, como he montado el storagebox en mi servidor .

## Instalar rclone

~~~sh
curl https://rclone.org/install.sh | bash
~~~

## Configurar rclone

Configuramos `rclone` para que no solo sincroniza, pero tambien encrypta todos los archivo que tenemos en [storagebox](https://www.hetzner.com/storage/storage-box/) .

~~~sh
nano ~/.config/rclone/rclone.conf
~~~

Copiamos los datos del bucket `b2storagebox`, creado previamente en [backblaze B2](https://www.backblaze.com/cloud-storage)
donde se van a sincronizar los datos como respaldo.

La configuración es similar a la siguiente.

~~~sh
[b2]
type = b2
account = BACKBLAZE_ACCOUNT_ID
key = BACKBLAZE_ACCOUNT_KEY
hard_delete = true

[b2-crypt]
type = crypt
remote = b2:b2storagebox
password = CRYPT_PASSWORD
~~~

## Sincronizar

Para realizar la copia de seguridad cifrada, ejecutamos.

~~~sh
rclone sync /mnt/pve/sb b2-crypt: \
       --transfers 1 \
       --b2-hard-delete \
       --fast-list \
       --progress
~~~

## Montar

Para montar b2 directamente en el servidor, para inspeccionar o hacer qualquier otra cosa .

~~~sh
sudo sed -i -e "s/#user_allow_other/user_allow_other/gi" /etc/fuse.conf
sudo chown -R $USER /mnt/pve/
mkdir -p /mnt/pve/B2
~~~

Ejecutamos.

~~~sh
rclone mount --config "~/.config/rclone/rclone.conf" --allow-non-empty --dir-cache-time 15m --allow-other --vfs-cache-mode full --umask 002 b2-crypt: /mnt/pve/B2 &
~~~

## Desmontar

~~~sh
fusermount -u -z /mnt/pve/B2
~~~

