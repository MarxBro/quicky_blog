# Vim: Optimizar el scroll

Esto es rápido...

A veces el scroll de vim es bastante molesto y necesitamos llegar al final de la
 pantalla para que comience a bajar/subir el buffer.

Eso se puede arreglar! Así:

    :set so=1000

__La idea es poner un número muy grande de "scrollbuffer" (que se abrevia so) para
 que se mueva el buffer y a línea en la que estamos escribiendo quede siempre en
 el medio__.


Se puede poner esta línea directamente en el vimrc:
    
    set scrollbuffer=1000

pero es recomendable explorar la idea primero (en mi caso, me resulta útil en C
y Markdown, Perl no tanto y HTML menos).

__Para todo lo demás, existe zz (en minúsculas) que trae la línea del curso al
centro del buffer__.

> Zaijian!
