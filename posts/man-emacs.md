# Ver las paginas man en Emacs

2012-12-06

Un ejemplo, como ver paginas `man` en emacs cuando se escribe `man` en la linea de comandos.

Basta con añadir la siguiente función al archivo de configuración `~/.bashrc` o `~./zshrc`.

~~~sh
man() {
  emacsclient -a "emacs" -t -e "(woman \"$1\")"
}
~~~

Recargar zsh, para que se aplican los cambios

~~~sh
source .zshrc
~~~

Ahora si quiero consultar alguna pagina usando el comando `man` se va a visializar en Emacs .

