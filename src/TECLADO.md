# Teclado USB en español

Me pasó que al conectar un teclado USB en mi notebook, el layout de las teclas
 estaba en inglés por defecto. 

En general, uso el layout español y este error es bastante común: de hecho, ni
 siquiera es un error ya que únicamente está levantando la configuración por
 defecto y no hay ninguna para los teclados USB.

_La idea es crear una regla de input para X11 que automáticamente ponga
 cualquier teclado usb al layout español_.

## Solución

Es simple.

Hay que crear un archivo en __/etc/X11/xorg.conf.d__, que contenga esto:

    Section "InputClass"
        Identifier         "Keyboard Defaults"
        MatchIsKeyboard	   "yes"
        MatchProduct       "keyboard"
        Option  "XkbLayout"  "es"
    EndSection

Al mío lo bauticé "11-usb-keyboard.conf" como habían sugerido en la [wiki
 de Arch](ttps://bbs.archlinux.org/viewtopic.php?id=130093), pero el nombre no importa demasiado. _Lo que sí importa es que tenga
 permisos de lectura para cualquier usuario que use el display_.

Después solo resta reiniciar X y enchufar el teclado.

## Si falla o si enchufo de nuevo?

Hmmm. sip, puede pasar que al reconectar el teclado no sea reconocido como debe.
 En tal situación reiniciar X puede ser molesto.

Este es un scriupt viejo que tenía en el path; de el se pueden sacar las ideas
principales y reaplicarlas a nuestro teclado USB:

* Filtar la salida de xinput hasta que tengamos el número de id de nuestro
  teclado. En mi caso, tengo que obtener el id del teclado que diga "SIGMACHIP".
* Usar setxkbmap para configurarlo en el layout de nuestra preferencia.


    TECLADO="$(xinput -list | grep 'SIGMACHIP USB' | grep 'keyboard' | awk -F= '{ print $2}' | awk '{print $1 }' | head -1 )"

    setxkbmap -device $TECLADO -layout es

    exit 0


> Zaijian!
