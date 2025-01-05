# Cómo he creado mi sitio web con wruby

2024-11-26

Hay muchas plataformas en las que puedes crear un sitio web o escribir un blog. 
Con algunas de ellas puedes crear tu sitio web desde cero, 
puedes usar un generador de sitios web estaticos o utilizar algunas de las (CMS) plataformas bastante famosas como Wordpress, Drupal, Chost, Medium como ejemplo, 
pero hay mas y la mayoria tiene coste bastante elevado segun cada criterio .

Personalmente siempre he preferido la opcion de usar un generator de sitios web estaticos. 
Durante los años he usado para la creacion de mi blog, algunos como Jekyll, Pelican, Nikola, Hugo incluso hasta Emacs + Org-mode y Org-Babel. 
Todas ellos son increibles, y si tienes conocimientos basicos puedes montar te un blog en 5 minutos, 
luego alojar en tu servidor o usar Github pages como ejemplo.

Pero, mi principal motivo de abandonar las opciones arriba, es porque siempre me a gustado tener un sitio web "simple", 
ligero sin elementos modernos, sin javascript y cosas inecesarias.
En general necesitaba alguna alternativa, que contiene solo los mas necesario para cumplir con todos mis requisitos y que sea muy facil de manejar y entender.

Al final encontre una alternativa, [wruby](https://wruby.btxx.org/) un sencillo generator de stios web estaticos, que usa un unico archivo escrito en Ruby para hacer la magia. 

## Instalar las dependencias

Segun el [README](https://git.sr.ht/~bt/wruby/tree/master/item/README.md), wruby se basa en Ruby 3.3.3 

> **⚠️ Aviso** 
>
> Si tenemos otras versiones instaladas, es mejor usar `rbenv` o `rvm` para evitar conflictos de privilegios).

### Instalar ruby 3.3.3 en Ubuntu 24.04 

Para instalar la version exacta de ruby en mi caso, usare `rbenv` . De otro modo, si instalamos ruby desde los repositorios de Ubuntu la version sera deferente.

~~~sh
sudo apt install rbenv libyaml-dev libffi-dev git
~~~

Instalamos la ultima version de `ruby-build`

> **⚠️ Aviso**
>
> Si tenemos instalado el paquete `ruby-build` desde los repositorios de Ubuntu, tenemos que deinstalar lo primero .

~~~sh
sudo apt remove ruby-build
~~~

Luego ya podemos actualizar lo.

~~~sh
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
~~~

Por ultimo, actualizar el plugin `ruby-build` para `rbenv`.

~~~sh
git -C "$(rbenv root)"/plugins/ruby-build pull
~~~

Ahora instalamos la version necesaria ruby 3.3.3 .

~~~sh
rbenv install 3.3.3
rbenv global 3.3.3
~~~

## Instalar wruby 

~~~sh
git clone https://git.sr.ht/\~bt/wruby/
cd wruby
rm -rf .git
~~~

Instalamos el resto de dependencias, y compilamos.

~~~sh
mv wruby website
cd website
sudo gem install 'find' 'yaml' 'fileutils' 'date' 'rss:0.3.0' 'kramdown:2.4.0'
make build
~~~

## Configuraciones

### Editamos los archivos

- _config.yml
- index.md
- header.html
- footer.html

No necesariamente, tambien podemos jugar con
el archivo `style.css` ubicado en el directorio `public/`, para darle un aspecto unico.

Para saber mas, recomiendo leer el [README](https://git.sr.ht/~bt/wruby/tree/master/item/README.md) 

## Crear noestro primer post

Todos las publicaciones tienen que ir al directorio `posts/` . 

Ejemplo: 

~~~sh
cd ~/website/posts/
nano fisrt-post.md
~~~

Con el seguiente contenido:

~~~sh
# Primer post

2024-11-26

Hola mundo!
~~~

Recreamos el sitio web de nuevo para aplicar los cambios .

~~~sh
make build
~~~

Felicidades, ya hemos creado noestro blog y noestro primer post!

## (Bonus) Alojando mi web

Requerimientos necesarios:

- [Caddy](https://caddyserver.com/)
- [Rsync](https://rsync.samba.org/)
- **Un dominio** - yo tengo el mio con [OVHcloud](https://www.ovhcloud.com/es-es/), despues de estar muchos años con Gandi .

Creamos el directorio `/var/www/ivaylokuzev.eu` (el directorio root donde estaran ubicados los archivos estaticos para el publico).

~~~sh
sudo mkdir -p /var/www/ivaylokuzev.eu
~~~

Instalamos `rsync` para sincronizar el directorio `build/` con el directorio root `/var/www/ivaylokuzev.eu`.

~~~sh
sudo apt install rsync
sudo rsync -rv build/ /var/www/ivaylokuzev.eu
~~~

## Configuramos el DNS

Tenemos que apuntar un dominio a la dirección IP, lo hice con la siguiente configuración:

~~~sh
Domain           Type  TTL      Target
ivaylokuzev.eu   A     default  123.456.78.90
~~~

## Configurando Caddy

Vamos a configurar [Caddy](https://caddyserver.com/) para que sirva esos archivos. 

~~~sh
sudo nano /etc/caddy/Caddyfile
~~~

Copiamos lo seguiente:

~~~sh
ivaylokuzev.eu {
   tls email@example.com
   encode gzip zstd
   root * /var/www/ivaylokuzev.eu
   file_server
}
~~~

La línea tls habilita HTTPS automático. Caddy obtendrá y renovará los certificados SSL para usted con cero configuración o mantenimiento.

Reiniciamos caddy:

~~~sh
sudo systemctl restart caddy
~~~

Y asi de facil y gratis, mi sitio se servira de forma segura a traves de HTTPS! 
