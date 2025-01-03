# Adiós Dwm, bienvenido Ratpoison

2012-05-17

Despues, de pasar casi dos años usando [Dwm](https://dwm.suckless.org/), y fue mi gestor de ventanas por defecto durante tanto tiempo, 
me cambie a [Ratpoison](https://www.nongnu.org/ratpoison/). 
No me malinterpreten, dwm es genial, lo unico que quiero es matar el ratón,y mantener mis manos siempre en el teclado, tambien trabajar a pantalla completa. 

![](/public/images/my-ratpoisonwm.png)

Para aquellos que no lo sepan, ratpoison es un gestor de ventanas minimalista que puede ser controlado 100% a través del teclado su slogan es: **Say good-bye to the rodent**. 
Sin mas dependencias del ratón, sin decoraciones bonitas, sin iconos, sin fondo de escritorio, cada ventana esta maximizada y utiliza cada pixel de nuestra pantalla, al mismo tiempo, la pantalla se puede dividir en dos o más marcos para mostrar mas de una ventana a la vez. 
Usado por gente que no quiere quitar las manos del teclado, geeks, desarrolladores, profesionales de la informática, gente con ordenadores antiguos, hackers 😎.

> Yo siempre uso el siguiente comando: `startx -- -nocursor` para iniciar X sin el cursor (no es broma 😋).

Una vez iniciado ratpoison, aparecera el siguiente mensaje en la esquina superior derecha, **"Bienvenido a ratpoison"**, para hacer cualquier cosa en ratpoison, es necesario introducir un comando de escape, 
que se consigue pulsando <kbd>Ctrl</kbd> + <kbd>t</kbd> , a continuación el cursor cambia su forma a un cuadrado, esto indica que ratpoison está esperando a que configuremos una opcion, probemos a abrir el terminal, pulsamos <kbd>Ctrl</kbd> + <kbd>t</kbd> y a continuación la tecla <kbd>c</kbd> , del mismo modo si pulsamos <kbd>Ctrl</kbd> + <kbd>?</kbd> veremos todos los comandos disponibles en ratpoison.

- <kbd>Ctrl</kbd> <kbd>t</kbd> + <kbd>q</kbd> salir de ratpoison
- <kbd>Ctrl</kbd> <kbd>t</kbd> + <kbd>?</kbd> muestra todos los comandos
- <kbd>Ctrl</kbd> <kbd>t</kbd> + <kbd>c</kbd> inicia el terminal
- <kbd>Ctrl</kbd> <kbd>t</kbd> + <kbd>n</kbd> muestra la ventana siguiente
- <kbd>Ctrl</kbd> <kbd>t</kbd> + <kbd>p</kbd> muestra la ventana anterior
- <kbd>Ctrl</kbd> <kbd>t</kbd> + <kbd>1</kbd> <kbd>2</kbd> <kbd>3</kbd> <kbd>4</kbd> <kbd>5</kbd> <kbd>6</kbd> <kbd>7</kbd> <kbd>8</kbd> <kbd>9</kbd> cambia a un numero de ventana determinado
- <kbd>Ctrl</kbd> <kbd>t</kbd> + <kbd>k</kbd> cierra una ventana determinada
- <kbd>Ctrl</kbd> <kbd>t</kbd> + <kbd>K</kbd> mata una ventana determinada
- <kbd>Ctrl</kbd> <kbd>t</kbd> + <kbd>s</kbd> <kbd>S</kbd> divide la ventana actual en dos, vertical y horizontal
- <kbd>Ctrl</kbd> <kbd>t</kbd> + <kbd>Tab</kbd> <kbd>←</kbd> <kbd>↑</kbd> <kbd>→</kbd> <kbd>↓</kbd> cambia a la siguiente ventana izquierda,arriba,derecha,abajo
- <kbd>Ctrl</kbd> <kbd>t</kbd> + <kbd>Q</kbd> hace que la ventana actual que sea solo una
- <kbd>Ctrl</kbd> <kbd>t</kbd> + <kbd>:</kbd> ¡comando de ejecución
- <kbd>Ctrl</kbd> <kbd>t</kbd> + <kbd>!</kbd> se usa para iniciar programas

Aprender mas [https://www.nongnu.org/ratpoison/doc/](https://www.nongnu.org/ratpoison/doc/)

Mi configuracion [~/.ratpoisonrc](https://github.com/ivoarch/.dot-org-files/blob/master/ratpoison.org)
