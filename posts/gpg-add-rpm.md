# Añadir una llave GPG a RPM paquetes

2015-06-15

## Paso 1. Generar clave gpg (clave pública y clave privada).

~~~sh
gpg --gen-key
~~~

Se le presentará una serie de preguntas de encriptación (seleccione los valores proporcionados por defecto). A continuación, introduzca un nombre real, una dirección de correo electrónico y un comentario (el comentario es opcional).

Obtendrá la siguiente respuesta:

> We need to generate a lot of random bytes. It is a good idea to perform some other action (type on the keyboard, move the mouse, utilize the disks) during the prime generation; this gives the random number generator a better chance to gain enough entropy.

Lo que significa que nuestra clave gpg ha empezado a generarse.

## Paso 2. Verifique que su clave gpg ha sido creada.

~~~sh
gpg --list-keys
~~~

## Paso 3. Exportar la clave pública del llavero a un archivo de texto.

~~~sh
gpg --export -a 'Ivaylo I. K.' > RPM-GPG-KEY-ivk
~~~

## Paso 4. Importar la clave pública en la base de datos RPM o DB .

>**💡Consejo**
> 
> Si planea compartir sus paquetes rpm con otros, asegúrese de que su archivo de clave pública está disponible en línea para que otros puedan comprobar los paquetes RPM

~~~sh
rpm --import RPM-GPG-KEY-ivk
~~~

## Paso 5. Compruebe las claves públicas disponibles en la base de datos RPM .

~~~sh
rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\n'
~~~

## Paso 6. Configure su archivo `~/.rpmmacros`.

Utilice un editor opcional para crear o editar el archivo.

Pegar lo siguiente:

~~~sh
%_signature gpg
%_gpg_path ~/.gnupg
%_gpg_name Ivaylo I. K.
%_gpgbin /usr/bin/gpg"
~~~

## Paso 7. Añada una clave a sus paquetes RPM.

### Añadir una clave para un paquete individual .

~~~sh
rpm --addsign git-1.7.7.3-1.el6.x86_64.rpm
~~~

### Añade una clave para todos los paquetes *.rpm en el directorio .

~~~sh
rpm --addsign *.rpm
~~~

## Paso 8. Compruebe la clave para asegurarse de que la ha añadido.

~~~sh
rpm --checksig git-1.7.7.3-1.el6.x86_64.rpm
~~~

Esté atento a la salida de gpg OK .

~~~sh
rpm --checksig git-1.7.7.3-1.el6.x86_64.rpm
git-1.7.7.3-1.el6.x86_64.rpm: (sha1) dsa sha1 md5 gpg OK
~~~

>**💡Consejo**
> 
> Añada una clave , mientras se está compilando con rpmbuild, sólo tiene que añadir `--sign` .

~~~sh
rpmbuild -ba --sign git.spec
~~~

## Eliminar la clave gpg del paquete RPM.

Buscar las claves públicas disponibles en la base de datos RPM .

~~~sh
rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\n'
~~~

Retire la llave correspondiente.

~~~sh
rpm -e --allmatches gpg-pubkey-012345678-0123456789
~~~
