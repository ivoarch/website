# Mi configuracion de GrapheneOS

2023-06-10

En este post quiero compartir mi configuracion del sistema operativo mas seguro para moviles [GrapheneOS](https://grapheneos.org/).

Antes de comenzar quiero añadir algunas practicas que he intentado seguir en la configuracion y a la hora de usar mi movil .

- Asegurar mi dispositivo con una contraseña robusta .
- Mantener el dispositivo actualizado, recibiendo los ultimos parches de seguridad.
- Encriptar mis archivos mas importantes.
- No insertar el dispositivo en puertos desconocidos.
- Nunca dejar mi dispositivo sin vigilancia o en las manos de otra persona.
- Comprobar las aplicaciones
antes de instalar.
     - comprobar los nombres de los desarrolladores y su existencia actual. 
     - leer la descripcion de las aplicaciones y sus permisiones .
     - leer reseñas de otros usuarios y guías de seguridad.
 - Reducir el numero de aplicaciones instaladas.

# Perfiles
En GrapheneOS se pueden crear deferentes perfiles de trabajo y asi no tener que usar el principal, el que tiene acceso a las configuraciones privelegiadas, es como una cuenta de Root para Linux. 
Yo personalmente los primeros meses he intentado usar perfiles separados y asi no tener todas las aplicaciones en un perfil , pero con el tiempo me di cuenta que es bastante incomodo de cambiar entre ellos y el movil consume mucho mas recursor y bateria, asi que volvi a usar solo el perfil principal .

El perfil lo tengo protegido con una contraseña para entrar y uso la huella digital solo para acceso a las aplicaciones que soportan esta opcion . Tengo activados tambien los servicios de Google y servicios de Push notificaciones .
Es importante saber que Google Play y los servicios de Google no reciben absolutamente ningún acceso o privilegio especial en GrapheneOS y no tienen nada que ver con el funcionamiento del sistema operativo. Son aplicaciones como qualquier otra aplicacion instalada . Es el mismo sandbox de aplicaciones y modelo de permisos .

Pero quiero añadir que si eres un fanatico de la privacidad, puede ser mejor para ti tener varios perfiles para seperar los servicios que usan Google, o separar las aplicaciones de bancos y redes sociales .
 
> **💡Consejo**
>
> Es recomendable instalar los servicios de Google desde la aplicacion App de GrapheneOS antes de instalar otras aplicaciones. De este modo las notificaciones se van a registrar correctamente . 

# Mi Configuracion

## Redes e Internet

- Tengo desactivado el uso de redes (2G) para la conexion con mi operador  . Activando esta opcion puede mejorar la conexion en algunas zonas rurales donde no se tiene buena red, pero no es de nada seguro usar las redes 2G el cifrado fue roto hace muchisimos años .
- He desactivado tambien "Notificar si hay una red publica de alta calidad disponible" .
- En mi movil estoy usando una targeta eSIM por esto e activado el uso de eSIM (eSIM ya no necesita tener los servicios de Google) puede saber mas sobre esto aqui - [https://grapheneos.org/releases#2024012600](https://grapheneos.org/releases#2024012600)
- Tengo configurado usar simpre VPN y bloquear las conexiones si no estoy conectado al VPN como prevencia .

## Dispositivos conectados

- Desconectar el Bluetooth automaticamente, en 30 segundos (si no hay dispositivos conectados) .
- Tengo desactivado el NFC por defecto (lo habilito solo cuando necesito usar por ejemplo con mis llaves de seguridad o con las targetas de Tangem).
- No conecto mi dispositivo en impresoras asi que tengo la opcion de Impresion desactivada .

## Aplicaciones
- Aqui repaso todas las aplicaciones para configurar permisos .

## Notificaciones

- Activar las notificaciones solo a las aplicaciones que realmente necesito .
- Desactivo que se guarda historial de notificaciones .
- Desactivo notificaciones en la pantalla de bloqueo .

## Bateria

-  Mostrar el porcentaje de bateria que queda en pantalla "Activado".
- Tengo desactivada la opcion compartir bateria, me parece una opcion estupida, no me recuedo haber la usado nunca .

## Sonido y vibracion

- Lo primero que hago aqui es configurar y activar la opcion de "No molestar",  dejando desactivada solo para mis contactos destacados. Desactivando las llamadas repetidas . Configurada para que se inicia de 22:00 hasta 07:00 horas todos los dias .
- Tengo ocultado el reproductor .
- Vibracion y vibracion al pulsar desactivadas.
- Tonos del teclado de marcacion desactivadas. 
- Sonido de bloqueo de pantalla desactivadas.
- Vibracion y sonido de carga desactivadas.
- Sonido al tocar y hacer clic desactivado.
- Activado el acceso directo para evitar que el dispositivo sueña.

## Pantalla
- En la pantalla de bloqueo no mostrar ninguna notificacion .
- Desactivar la opcion de "Levantar telefono" para consultar lo .
- Desactivar  "Tocar telefono para consultar lo"
- Desctivar "Activar pantalla si hay notificaciones"
- Desactivar control de dispositivos, sin desbloquear el movil.
- Desactivar todos los access directos desde la pantalla de bloqueo .
- Aspecto Tema oscuro .
- Activar Luz nocturna, hora de inicio 22:00 fin 07:00
- Desactivar "Salvapantallas"

## Fondo de pantalla y estilo
Me gusta usar mi dispositivo sin ningun fondo de pantalla tambien poner todo con menos color posible .

- Pantalla de bloqueo seleccionar colores Monochrome .
- Pantalla de bloqueo desactivar "Mostrar notificaciones en la pantalla"
- Pantalla de inicio seleccionar colores Monochrome
- Pantalla de inicio, activar Iconos tematicos .

## Privacidad y Seguridad

- Bloqueo de pantalla configurada para bloquer se despues de 5 segundos de inactividad .
- Desactivar usar huella para desbloquer la pantalla. 
- Configurar "Durres password" (Anadir un PIN y una Cotraseña para borrar todo del dispositivo y volver a estado predeterminado. Esta opcion se puede usar en casos donde estas forzado de las autoridades o desconocidos a abrir y enseñar tu movil).
- Activar "Privacidad de PIN mejorada" (Los numeros del teclado cambian de sitio, si alquien te esta observando a la hora de introducir tu PIN sera mas deficil que vea que numeros estas marcando).
- Activar la opcion de bloquear el dispositivo, con el buton the encendido .
- Desactivar la opcion de tener acceso rapido a la camera cuando la pantalla esta bloqueada .
- Desactivar el acceso por defecto para la camera y el micro para las aplicaciones .
- Activar la opcion de mostrar el portapapeles cuando copiamos algo .
- Desactivar el acceso a la camera .
- Desactivar el acceso a la ubicacion.
- Configurar Reinicio automatico en 18 horas. Si en 18 horas no usas para nada el movil se va a reiniciar .
- Puerto USB-C configurar en modo (Charging-only when locked)
- Desacrivar conexion Wifi automaticamente, si no estas conectado en una red Wifi en mas de 1 minuto.
 - Dessctivar todas la notificaciones en la pantalla de bloqueo .
- Desactivar los permisos a los "Sensores" para las aplicaciones por defecto .
- Activar las notificaciones sobre los fallos de sistema .

## Ubicacion

- La tengo desactivada (Uso solo cuando necesito usar Google Maps) . 

## Seguridad y emergencias
 
- Desactivar alertas de emergencias inalabricas.

## Contraseñas y Cuentas
- Configurar Servicio preferido - Bitwarden

## Systema

- Desactivar "Abrir camera rapidamente"
- Ajustes del teclado - Aqui tengo todo desacrivado menos la opcion de ampilar al pulsar la tecla
- Modo de nvegacion , activada la opcion "Navegacion con  3 butones"
- Desactivar "Tocar telefono para consultar"
- Desactivar "Levantar telefono oara consultar"
- Desactivar  "Usar hora regional predeterminada" 
- Usar formato de 24 horas

## Informacion del telefono

- Nombre de despositivo, es recomentable usar un nombre generico, como por ejemplo "Device" . Nunca poner tu nombre, o algo que puede comprometer tu privacidad .

# Tiendas de aplicaciones

- App Store (La app de GrapheneOS por defecto)
- [Accrescent](https://accrescent.app/) (Tienda de aplicaciones para Android centrada en la seguridad, la privacidad y la facilidad de uso.)
- [Obtainium](https://obtainium.imranr.dev/) (Para instalar aplicaciones open source directamente de Github, Gitlab etc...)
- Google Play Store (Para instalar la mayoria de las aplicaciones) . 

# Aplicaciones que uso

- **Navegador Web**
      - Por defecto (Vanadium)
- **Camera**
     - La aplicacion de camera por defecto
- **Galeria**
     - La aplicacion por defecto
- **Navegador de archivos & Cloud**
     -  La aplicacion por defecto
     - [Round Sync](https://github.com/newhinton/Round-Sync)
- **Lector PDF**
     - La aplicacion por defecto
- **Contactos y sincronizacion**
    - La aplicacion de Contactos por defecto
    - [Tuta](https://tuta.com/)
    - Tambien hago copias de seguridad exportando `*.vcf` archivo.
- **Gestor de contraseñas y 2FA Autenticador**
    - [Bitwarden](https://bitwarden.com/) 
- **Correo electronico, Calendar y Contactos**
    - [Tuta](https://tuta.com/)
    - [Thunderbird](https://www.thunderbird.net/en-GB/mobile/) para manejar mi vieja cuenta de Gmail, que todavia uso para algunas comunicaciones .
- **Anti-spam proteccion**
    - [Addy](https://addy.io)
- **Nube para guardar algunos archivos**
    - [Koofr](https://koofr.eu)
    - [Koofr Vault](https://vault.koofr.net/)
- **Notas**
    - [Joplin](https://joplinapp.org/)
- **Para guardar fotos encryptadas en la nube**
    - [Ente](https://ente.io/) 
- **YouTube frontend**
    - [NewPipe](https://f-droid.org/en/packages/org.schabi.newpipe/) para no comerte anuncios .
- **Reproductor de Musica y Videos**
    - [VLC Media Player](https://f-droid.org/en/packages/org.videolan.vlc/)
    - [Jellyfin](https://jellyfin.org/) 
- **Mensajes**
     - La aplicacion de mensajes de text por defecto
     - [WhatsApp](https://www.whatsapp.com)
     - [Signal](https://signal.org/es/)
- **VPN**
     - [Mullvad](https://mullvad.net/es)
- **Encriptar archivos y generar claves PGP**
     - [Cryptomator](https://cryptomator.org/)
     - [OpenKeychain](https://www.openkeychain.org)
- **Rss/Feed lector**
     - [Feeder](https://f-droid.org/en/packages/com.nononsenseapps.feeder/)
- **Bookmark Manager**
    - [Linkding](https://linkding.link/)
    - [Pinkt](https://github.com/fibelatti/pinboard-kotlin) Cliente no oficial para Linkding
- **Editor de Text y Markdown**
    - [BeauTyXT](https://beautyxt.app/)
- **Office paquete**
    - [CryptPad](https://cryptpad.org/)
    - [Collabora Office](https://www.collaboraonline.com/collabora-office-android-ios/) Para poder visualizar algun documentos cuando es necesaria desde movil.
- **Translator**
    - [Deepl](https://play.google.com/store/apps/details?id=com.deepl.mobiletranslator)
- **Navigacion**
    - Google Maps
- **Billatera fria para cripto**
    - [Tangem](https://tangem.com)
- **Grabadora de voz**
    - [Fossify Voice Recorder](https://github.com/FossifyOrg/Voice-Recorder)
- Informacion del sistema
    - [Cpu-info](https://github.com/kamgurgul/cpu-info)
- Redes Sociales
    -  [RedReader](https://github.com/QuantumBadger/RedReader) (Actualmente solo uso Reddit).
- **Terminal emulator**
    - [Termux](https://github.com/termux/termux-app)
 
# Captura de pantalla

![](/public/images/93c08848.png)

# Accessories

- [Cubrir la camera delantera](https://shop.nitrokey.com/shop/product/nk-cov-webcam-cover-104?page=2)
- [Llave de seguridad - Yubikey](https://www.yubico.com/is/store/) 

> **⚠️ Aviso**
> 
> Necesitas tener instalados los servicios de Google para usar llaves de seguridad .

# Recursos adicionales

### Canales oficiales

- <https://grapheneos.org>
- <https://grapheneos.org/articles>
- <https://discuss.grapheneos.org>
