# Zebra para un Excel

Alguien me preguntó como hacer para no volverse loco al colorear una hoja de
 cálculo en el estilo "zebra" (una fila de un color, la próxima de otro, etc.).

La respuesta es fácil en LibreOffice, calculo que en Excel es la misma idea pero
 hace rato no lo uso...

Básicamente, hay que colorear todas las filas que **son pares** distinto a las
 que son impares. Se puede hacer esto mediante el **formato condicional**.

*Antes que nada es importante seleccionar el rango de celdas a formatear...*

En el menú "Formato >> Formato Condicional", elegir la opción
 "Manage". Esta opción sirve para administrar los formatos y crear nuevos; a
 nosotros nos interesa crear uno, bien simple, que seleccione las celdas a
 colorear y listo.

Ahí hay que agregar una nueva regla y elegir que la condición sea **Formula
 is**. Esto nos va a habilitar un espacio en donde escribir nuestra formula, que
 es exactamente lo que buscamos. Ahí escribir:

    ISODD(ROW())

o equivalentemente:

    ISEVEN(ROW())

_Si el programa está en español, los nombres de las fórmulas cambian:_

    ESIMPAR(FILA())

Ahora falta seleccionar el formato; en mi caso, prefiero siempre "customizar" el
 estilo (ya que los predefinidos apestan). **Lo único que nos resta hacer es
 cambiar el color de fondo** y listo...

![colorines-cebra-libreoffice](/data/zebra.jpg)

> Uso LibreOffice en inglés, puede ser que las opciones del menú se llamen distinto...

