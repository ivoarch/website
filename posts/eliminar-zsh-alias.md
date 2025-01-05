# Desactivar o eliminar alias en zsh

2015-10-24

## Eliminar alias por completo

Puede eliminar el alias `foo` por completo escribiendo.

~~~sh
unalias foo
~~~

## Desactivar alias temporalmente

Tambien puede desactivar un `alias` solo temporalmente .

~~~sh
disable -a foo
~~~

Para activa de nuevo `alias foo`

~~~sh
enable -a foo
~~~

## Desactivar todos los alias

~~~sh
unalias -m '*'
~~~

O tambien puede hacer lo mismo usando la opcion de zsh `setopt no_aliases`
