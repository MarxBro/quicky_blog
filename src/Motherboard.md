# ¿Cómo saber mi motherboard en Linux?

Supongamos que necesitamos saber que motherboard (marca/modelo) nuestra PC está utilizando...

Sí, ya sé, normalmente uno puede rebootear y buscar la información en el BIOS,
 pero a veces eso no es posible: puede tratarse de un sistema que necesite un uptime del 100% (o virtual),
 o simplemente nos da mucha paj... _pereza_ resetear.

Básicamente, hay un par de formas; esta es mi favorita y funciona bastante bien:

    dmidecode | grep -A3 '^Base Board'


Leí por ahí que en algunos casos es necesaria esta variante:

    dmidecode | grep -A3 '^System Information'

La desventaja es que depende del programa __dmidecode__ que _no siempre_ está disponible... 

_Sin embargo es la más efectiva_.

Zaijian!
