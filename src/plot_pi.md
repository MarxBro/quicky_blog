# Ploteando los decimales de Pi

Sin aparente razón o propósito mayor, se me ocurrió "plotear" 
(hacer un gráfico de) algunos decimales de pi.

El programa es bastante tosco y simple, es un script (obviamente en perl) 
 que básicamente ilustra los primeros 500 decimales de pi usando _Imager_ y
 _bignum_.

## ¿Cómo se ve?

Algo así fué en su primer intento:

!["primer intento de ploteo"](/data/pi.png)

Como no se de colores y no soy diseñador, elegí un único tono...

Después me pintó cambiar justamente el tono en pasos hexadecimales y el
 resultado ilustra un poco más la idea, aunque era bastante feo; decidí copiar
 una paleta de colores que encontré por ahí y el resultado fue mas feo...

!["segundo intento de ploteo"](/data/pi_color.png)

Después se me ocurrió que iba a ser mucho más feliz si ponía el número que cada
 color representaba en la imagen.

!["tercer intento de ploteo"](/data/pi_nros.png)

Un último intento, simple y más útil: únicamente escribe el número si es la
 primera vez que éste aparece en la serie...

!["cuarto intento de ploteo"](/data/pi_nros_unicos.png)

Hmmm... poco util.

## ¿Conclusiones?

Las conclusiones se las dejo a los matemáticos y la _data visualization_ es mucho
 mejor con la ayuda de algún diseñador, aunque (en palabras del maestro):

> "The nature of form in the digital age is trapped in the realm of code." 
>>   John Maeda.

## Código

Subí esta cosa a [github](https://github.com/MarxBro/pi_plot) por si hay algún remoto interés...

Si alguien tiene ganas de _paletear la idea mas estśticamente_, es __mas que
 bienvenido__.

