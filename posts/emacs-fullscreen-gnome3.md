# Emacs en pantalla completa en Gnome 3 

2013-10-07

No se de vosotros, pero yo necesito mucho espacio cuando trabajo con emacs. 
Llevo más de un mes usando Gnome3 en Fedora, y una de las cosas que no he tenido tiempo de hacer, es configurar emacs para que se abra en pantalla completa.

Despues de dar muchas vueltas y probar varios metodos, he conseguido montar una solución que de momento funciona.

Primero instalar el paquete `wmctrl`:

~~~sh
sudo yum install wmctrl
~~~

Despues añadir en `~/.emacs` o `init.el` archivo de configuracion.

~~~sh
; FULLSCREEN
(defun toggle-bars ()
  "Toggles bars visibility."
  (interactive)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(defun switch-full-screen ()
  "Switch to fullscreen in Emacs"
  (interactive)
  (toggle-bars)
  (shell-command "wmctrl -r :ACTIVE: -btoggle,fullscreen"))
  (global-set-key [f11] 'switch-full-screen)
~~~

Ahora, tras pulsar el buton <kbd>F11</kbd> emacs cambiará de pantalla normal a pantalla completa, y viceversa.
