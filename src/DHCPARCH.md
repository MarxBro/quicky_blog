# DHCP al bootear

Quería configurar un sistema para que ejecute dhcp al bootear en Arch.

Encontré varias formas, pero la única que me cerró en su simpleza es la que voy a anotar acá para que me quede en algún lado.

## netctl: profileame la red

Sip... vamos a ir por ese camino. *Que conste que el título no es "profileame la nutria" finalmente*.

En el caso que nos atañe, solo queremos configurar dhcpd (el daemon) para que arranque solito junto al sistema en la interface **eth0** (el nombre puede cambiar, la idea es la misma).

Suele haber un ejemplo para este caso, el más básico de todos... *convengamos*.

    ls /etc/netctl/examples

En mi caso se llama **ethernet-dhcp** y se ve más o menos así:

    Description='A basic dhcp ethernet connection'
    Interface=eth0
    Connection=ethernet
    IP=dhcp
    #DHCPClient=dhcpcd
    #DHCPReleaseOnStop=no
    ## for DHCPv6
    #IP6=dhcp
    #DHCP6Client=dhclient
    ## for IPv6 autoconfiguration
    #IP6=stateless

Con eso alcanza, pero se puede configurar a gusto. Por ejemplo, para habilitar ipv6 descomentar las línea que empieza con "IP6" *and so on*... Es bastante fácil.

## netctl: habilitame el profile

Ahora habría que copiar ese archivo de ejemplo y renombrarlo con algo significativo como "dhcpt-ame" (LOL).

**No olvidarse de mover la copia del archivo una carpeta arriba, o sea ponerlo en /etc/netctl/NOMBRE.**

Cuando esté ubicado ahí, netctl lo va a encontrar como profile posible y lo va a mostrar en la lista:

    netctl list

Con el archivo hecho:

    netctl enable dhcpt-ame


Eso es *casi* todo. "Nutria". Eso es todo finalmente...

> Jiji...
