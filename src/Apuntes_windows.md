# Apuntes Windows

Estos son algunos apuntes e ideas que fui anotando a raíz de un trabajo en un
 servidor que tenía Windows Server 2012.

## Eliminar simptcp

Eliminar este protocolo, como primer paso y antes de hacer cualquier otra cosa.

## Cambiar cuaquier contraseña por defecto

Esto tiene que ser un paso automático, pero es sorprendente la cantidad de veces
 que no se hace. Si al servidor se va a conectar gente por RDP (escritorio
 remoto) es menester cambiar el password de esas cuentas de usuario.

## Agregar la menor cantidad de funciones desde el panel inicial

Ditto. Las funciones hay que agregarlas unicamente si se sabe de antemano y muy
 claramente qué hacen, cómo y mediante qué medios.

Las herramientas que Windows ofrece para
 gestionar los servicios son muy a menudo inferiores a lo que se encuentra en la
 comunidad open source (por no decir que siempre son inferiores).

## Servicios del sistema

No gastarse _nunca_ configurando servicios desde el asistente de Windows: es una
 muy mala idea.

En su lugar, utilizar [nssm](https://nssm.cc/).

## Mailing

Utilizar [hMailServer](http://www.hmailserver.com).

## Para remover software

Utilizar algún programa externo, ya que el propietario guarda el registro y
 algunos archivos que quedan huérfanos y pueden contaminar re-instalaciones.

Usé Revo Uninstaller, me alcanzaba con el trial.

## Configurar el firewall

No olvidarse de configurar el firewall y bloquear todo el tráfico ajeno al
 localhost en casi todos los puertos en desuso.
 
## Monitorear los recursos

Averiguar bien qué es lo que consume CPU, qué tare desempeña y no olvidarse que
 hay muchas páginas que detallan el nombre y función de muchas de esas
 aplicaciones: en un día normal, una buena parte de los servicios en ejecución
 son  innecesarios.

## Ojo con el audio

El audio puede ser reproducido localmente o forwardeado a nuestro sistema
 (remotamente). 

En el primer caso, no vamos a escuchar nada y el audio va a estar
 disponible para el sistema "local" (lo que es deseable por ejemplo, en una situación de streaming).

En el segundo caso, nada queda en el sistema "local" y todo va a parar a nuestro sistema
 (que es remoto en este caso) para ser reproducido por nuestros parlantes...

Es recomendable investigar portaudio y liquidsoap si la idea viene por el lado
 de un servidor para streaming.

## Usar Sync

No puedo recomendarlo más: usar bittorrent sync y a olvidarse del FTP (y
Dropbox).

## Los usuarios en el FTP son un dolor de testículos

Sip. Hay un servidor de FTP, que permite administrar sitios FTP, con
 carpetas reales, bla bla.

Ahora, para conectarse, el nombre de usuario va a ser siempre una aberración de
 este estilo: **nombre.delhostftp.com|USUARIO1**.

Hay otras opciones de servidores para este protocolo.

> Continuará...
