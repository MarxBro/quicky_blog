# Vim: Optimizar el scroll

Esto es rápido...

A veces el scroll de vim es bastante molesto y necesitamos llegar al final de la
 pantalla para que comeince a bajar/subir el buffer.

Eso se puede arreglar! Así:

    :set so=1000

La idea es poner un número muy grande de "scrollbuffer" (que se abrevia so) para
 que se mueva el buffer y a línea en la que estamos escribiendo quede siempre en
 el medio.

> Zaijian!
