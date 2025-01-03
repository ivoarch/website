# Emacs guru-mode

2012-07-16

Si estás aprendiendo Emacs, necesitas acostumbrarte a las teclas de navegación corectas, para navegar en un lugar específico dentro del texto en la pantalla. 
Puedes hacerlo de varias maneras. Puedes usar las teclas de flecha, pero es más eficiente mantener tus manos en posición usando los comandos estándar **C-p**, **C-b**, **C-f**, y **C-n**. 
Estos simbolos equivalen a las cuatro teclas de flecha, como se indica a continuación:

~~~sh
              Linea anterior, C-p


Atras, C-b    Posición actual del cursor   Adelante, C-f



              Linea sigiente, C-n
~~~

[Guru-mode](https://github.com/bbatsov/guru-mode), escrito por Bozhidar Batsov, desactiva los comandos de teclado con las teclas de dirección y fuerza usar solo las alternativas establecidas por Emacs.

Si usas Emacs/24, o tienes la última versión de `package.el` puedes instalar facilmente **Guru-mode** desde los repositorios **Marmalade** y **Melpa**, con el comando `M-x package-install` . 
Una vez instalado, añade lo siguiente, en tu archivo de configuracion de emacs .

~~~sh
(require 'guru-mode)
(guru-global-mode +1)
~~~
