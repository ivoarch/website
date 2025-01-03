# Rotterdam Terror Corps - ascii fotos coloradas en terminal

2022-06-13

Como gran fanático de la música [Hardcore](https://en.m.wikipedia.org/wiki/Hardcore_(electronic_dance_music_genre)) / [Gabber](https://en.m.wikipedia.org/wiki/Gabber) y Linux.
He creado dos scripts, ascii fotos con el logo de la calavera de [Rotterdam Terror Corps](https://en.m.wikipedia.org/wiki/Rotterdam_Terror_Corps) para mostrar mi amor y argullo de llaver el gabber en el corazon, desde el propio terminal en Linux.

# Primer script

~~~sh
#!/bin/sh 
# - "rtc.sh"
# - Autor: "Ivo"  
# -------------------------------------------------------|

initializeANSI()
{
 esc="" 
 
redf="${esc}[31m";   
greenf="${esc}[32m" 
purplef="${esc}[35m"  
whitef="${esc}[37m"
yellowf="${esc}[33m"
reset="${esc}[0m"
} 
 
clear 

initializeANSI

cat << EOF 
 
${redf}MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
${redf}MMMMMMMMMMMMMMMMMMNKOOKMMMMMMMMMMMMMMMMMMMM
${redf}MMMMMMMMMMMMM${greenf}Xkdddk0KK${whitef}o${greenf}M${redf},........:KMMMMMMMM
${redf}MMMMMMWMMM${greenf}XdoxXMMMMMMW${whitef}x${greenf}M${redf}.   ooc    NMMMMMMM
${redf}MMMM${greenf}kcooxldNMMMMMMMMMM${whitef}O${greenf}M${redf}.   kOd   .NMMMMMMM
${redf}MMN${greenf}cxMMM0WMMMMMMMMMMMM${whitef}X${greenf}M${redf}.       .lNMMMMMMMM
${redf}MN${greenf}:0MMMk${purplef}..${greenf}lKMMMMMMMMMMNM${redf}.   Nx   .KMMMMMMMM
${redf}M${greenf}cOMMMx${purplef}.... ${greenf}'dNMMMMMMMMM${redf}.   WMk   .KMMMMMMM
${greenf}OlMMMK${purplef}. ...   .${greenf};kWMMMMMM${redf}l::lWMMk:::oMMMMMMM
${greenf};KMMM; ${purplef} ........ .${greenf}c0MMMM${redf}MMMMMMMMMMMMMMMMMMM
${greenf},WMMN. ${purplef} .....     ..${greenf}'dNM${redf}0ddddddddddkMMMMMMM
${greenf}:lkNW00KKKKXXXNNNNWWWMKW${redf}:          .MMMMMMM
${greenf}MccOWMMMMMMMMMMMMMMMMN${whitef},${greenf}W${redf}XKKK.   0KKKMMMMMMM
${redf}MN${greenf}WMWMMMMMMMN0OMMMMMM${whitef}c.${greenf}W${redf}MMMM${redf}'   WMMMMMMMMMM
${redf}MMMM${greenf}WKkxkd:'${whitef}. ${greenf} cWMMMk${whitef};k${greenf}M${redf}MMMM${redf}'   WMMMMMMMMMM
${redf}MMMMMMMNk${greenf}xXNkl${whitef}..${greenf}KMMM${whitef}X${greenf}MMM${redf}MMMM${redf}'   WMMMMMMMMMM
${redf}MMMMMMMMMMMMMM${greenf}${whitef};'${greenf}WMMMMMMM${redf}MMMM${redf},  .WMMMMMMMMMM
${redf}MMMMMMMMMMMMMM${greenf}${whitef},${greenf}lMMMMMMMM${redf}MMMMWWWWMMMMMMMMMMM
${redf}MMMMMMMMMMMMMW${greenf}${whitef}.${greenf}0MMMMMMMM${redf}MWk;.   .;kMMMMMMMM
${redf}MMMMMMMMMMMMMN${greenf}${whitef},${greenf}WMW${yellowf}X${greenf}MMMx${yellowf}W${redf}N.   ,c;   :MMMMMMM
${redf}MMMMMMMMMMMMM${greenf}KlMMW${yellowf}o${greenf}MMMd${yellowf}W${redf}l   oMMMKx0XMMMMMMM
${redf}MMMMMMMMMMMMM${greenf}OOMMW${yellowf}x${greenf}MMMk${yellowf}W${redf}:   OMMMMWMMMMMMMMM
${redf}MMMMMMMMMMMMM${greenf}ONMMW${yellowf}O${greenf}MMMO${yellowf}W${redf}x   :WMWc .;WMMMMMM
${redf}MMMMMMMMMMMMM${greenf}XMMMW${yellowf}K${greenf}MMMK${yellowf}W${redf}Mo    .    dMMMMMMM
${redf}MMMMMMMMMMMMMMMMM${greenf}W${yellowf}X${greenf}MMMN${yellowf}W${redf}MMNxc;;;cxNMMMMMMMM
${redf}MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
EOF
~~~

![](/public/images/IMG_RTC_133301.jpg)

El codigo tambien se puede descargar desde [github](https://raw.githubusercontent.com/ivoarch/ansi-scripts/refs/heads/main/rtc.sh)

## Segundo script

~~~sh
#!/bin/sh 
# - "rtc2.sh" 
# - Autor: "Ivo" 
# ----------------------------------------------------------| 

initializeANSI()
{
  esc=""

  blackf="${esc}[30m";  
  redf="${esc}[31m";     
  greenf="${esc}[32m"
  purplef="${esc}[35m"    
  reset="${esc}[0m"

}

initializeANSI

cat << EOF 


${redf}MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
${redf}MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
${redf}MMMMMMMMMMMMMMMMMMMM${greenf}WX0O${blackf}XO${greenf}O0X${redf}MMMMMMMMMMMMMMMMMMMMM
${redf}MMMMMMMMMMMMMMM${greenf}W0ddxxk0x${blackf}o:${greenf}K0kxddxK${redf}MMMMMMMMMMMMMMMM
${redf}MMMMMMMMMM${blackf}O${greenf}oO0llxNMMMMMX${blackf}dd${greenf}MMMMMMKdldKk${blackf}oX${redf}MMMMMMMMMM
${redf}MMMMMMMM${blackf}Wcc${greenf}NOdNMMMMMMMMW${blackf}kk${greenf}MMMMMMMMMKdX${blackf}K;x${redf}MMMMMMMMM
${redf}MMMMMMM${blackf}W;${greenf}dMMO${purplef}.${greenf}c0MMMMMMMM${blackf}00${greenf}MMMMMMMWk${purplef},.${greenf}0MW${blackf};d${redf}MMMMMMMM
${redf}MMMMMMM${blackf}co${greenf}MM${purplef}x    ${purplef}.${greenf}oXMMMMMWWMMMMWO${purplef}:.   ${purplef}.${greenf}0MW${blackf};O${redf}MMMMMMM
${redf}MMMMMM${blackf}K${greenf},WM${purplef}K        ${purplef}'${greenf}xWMMMMMMXl${purplef}.       .${greenf}WM0${blackf},${redf}MMMMMMM
${redf}MMMMMM${blackf}d${greenf}lMMo          ${purplef}.${greenf}c0MWk${purplef},${greenf}           kMM'${blackf}K${redf}MMMMMM
${redf}MMMMMM${blackf}O;${greenf}l0X00000OOOOOOO0KK00000KKKKKKKKXkc${blackf}:X${redf}MMMMMM
${redf}MMMMMMM${blackf}0x${greenf}NMMMMMMMMMMMMMW${blackf}.;${greenf}WMMMMMMMMMMMMMX${blackf}dN${redf}MMMMMMM
${redf}MMMMMMMMMM${blackf}XOXWKxl;x${greenf}MMMM${blackf}c  d${greenf}MMMW${blackf}c;lxOX00X${redf}MMMMMMMMMM
${redf}MMMMMMMMMMMN${blackf}x:cl'  d${greenf}MMK${blackf}d${greenf}NK${blackf}o${greenf}NMM${blackf}: .;oclK${redf}MMMMMMMMMMMM
${redf}MMMMMMMMMMMMMMMMM${blackf}O O${greenf}MMMMMMMMMM${blackf}o X${redf}MMMMMMMMMMMMMMMMM
${redf}MMMMMMMMMMMMMMMMM${blackf}k.W${greenf}MMMMMMMMMM${blackf}K 0${redf}MMMMMMMMMMMMMMMMM
${redf}MMMMMMMMMMMMMMMMM${blackf}d:${greenf}MMMMMNWMMMMM${blackf},k${redf}MMMMMMMMMMMMMMMMM
${redf}MMMMMMMMMMMMMMMMM${blackf}lk${greenf}M${blackf}KO${greenf}MMl${blackf}x${greenf}MM${blackf}xK${greenf}M${blackf}dd${redf}MMMMMMMMMMMMMMMMM
${redf}MMMMMMMMMMMMMMMMM${blackf}d${greenf}WM${blackf}Ok${greenf}MMl${blackf}k${greenf}MM${blackf}xK${greenf}MN${blackf}o${redf}MMMMMMMMMMMMMMMMM
${redf}MMMMMMMMMMMMMMMMM${blackf}O${greenf}MM${blackf}00${greenf}MMd${blackf}0${greenf}MM${blackf}OK${greenf}MM${blackf}O${redf}MMMMMMMMMMMMMMMMM
${redf}MMMMMMMMMMMMMMMMM${blackf}W${greenf}MM${blackf}KX${greenf}MMO${blackf}K${greenf}MM${blackf}XX${greenf}MM${blackf}W${redf}MMMMMMMMMMMMMMMMM
${redf}MMMMMMMMMMMMMMMMMMMMWWMMKNMMMMMMMMMMMMMMMMMMMMMMMM
${redf}MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
${redf}MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
${redf}MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM

 
EOF
~~~

![](/public/images/IMG_RTC_133325.jpg)

El codigo tambien se puede descargar desde [github](https://raw.githubusercontent.com/ivoarch/ansi-scripts/refs/heads/main/rtc2.sh)
