# Buenas prácticas para la gestión de contraseñas y proteger Bitwarden

2023-05-14

Pasos a segur para proteger la cuenta de [Bitwarden ](https://bitwarden.com/) y noestras contraseñas.

- 🎲 Crear una contraseña aliatoria y segura usando un gestor de contraseñas. Nunca reutilizar la misma contraseña para otra cuenta.

- 📩 Utilizar correo electronico unico, solo para el inicio de la cuenta de Bitwarden .

- 🔐 Habilitar el segundo factor de autenticación mediante FIDO2 WebAuthn y llaves de seguridad . En mi caso tengo unas cuantas llaves [Yubikey](https://www.yubico.com/la-yubikey/?lang=es)
de deferentes tipo A y C . Una tengo siempre conmigo y el resto de llaves estan guardados de respaldo en sitios seguros .

- 💾 Guardar copias de emergencia en sitio de confiansa que contienen todo lo necesaria para iniciar o restablecer la cuenta . Pueden generar y imprimir una plantilla desde esta pagina web [https://passwordbits.com/emergency-sheet.html](https://passwordbits.com/emergency-sheet.html).

- 🚨 Cambia las contraseñas sólo cuando puedan haber sido comprometidas .

- 🎣 Si necesita iniciar session desde la pagina web (Web Vault) de Bitwarden, intenta usar el menu de la aplicacion , `Configuracion -> Acerca de -> Web Vault` , despues guarda el enlace como Favoritos ⭐ en tu navegador. De este modo te proteges de sitios maliciosos que intentan parecer la pagina oficial de Bitwarden y robar te las credenciales .

- 📰 Intenta estar al dia con todas las novedas de la comunidad .

- 💾 Hacer copias de seguridad, exportando tu `*.json` archivo respetando al menos la estrategia de 3.2.1 (crear tres copias de seguridad , dos en diferentes dispositivos de almacenamiento y una off-site que evitará la pérdida de datos debida a un desastre local o a un fallo específico del emplazamiento). No hay que olvidar encriptar de algun modo, si exportamos el archivo en texto plano .
