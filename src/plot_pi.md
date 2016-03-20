# Ploteando los decimales de Pi

Sin aparente razón o propósito mayor, se me ocurrió "plotear" 
(hacer un gráfico de) algunos decimales de pi.

Abajo están los que usé. Incluye el 3 inicial y redondeado a 500
cifras. No debería romperse el formato, son diez líneas de cincuenta dígitos
 cada una:

    31415926535897932384626433832795028841971693993751
    05820974944592307816406286208998628034825342117067
    98214808651328230664709384460955058223172535940812
    84811174502841027019385211055596446229489549303819
    64428810975665933446128475648233786783165271201909
    14564856692346034861045432664821339360726024914127
    37245870066063155881748815209209628292540917153643
    67892590360011330530548820466521384146951941511609
    43305727036575959195309218611738193261179310511854
    80744623799627495673518857527248912279381830119491

El programa es bastante tosco y simple, es un script (obviamente en perl) 
 que básicamente ilustra los primeros 500 decimales de pi usando _Imager_ y
 _bignum_.

## ¿Cómo se ve el resultado?

Algo así fue en su primer intento:

!["primer intento de ploteo"](/data/pi.png)

Como no se de colores y no soy diseñador, elegí un único tono...

Después me pintó cambiar justamente el tono en pasos hexadecimales y el
 resultado ilustra un poco más la idea, aunque era bastante feo; decidí copiar
 una paleta de colores que encontré por ahí y el resultado fue mas feo...

!["segundo intento de ploteo"](/data/pi_color.png)

Después se me ocurrió que iba a ser mucho más feliz si ponía el número que cada
 color representaba en la imagen.

!["tercer intento de ploteo"](/data/pi_nros.png)

Un último intento: únicamente escribe el número si es la primera vez que éste aparece en la serie...

!["cuarto intento de ploteo"](/data/pi_nros_unicos.png)

Hmmm... No es el gráfico mas útil que hay, pero muestra como __el cero tarda un
rato en llegar__. No termina siendo una gran revelación...

Como se veía _mal_ todavía, decidí armar una paleta personal para encariñarme un
poco con los resultados que estoy produciendo (ja), 
[acá está](https://color.hailpixel.com/#FAF0F0,DBB294,D09471,C14A44,633621,3E4D19,1F5C50,123629,0A1D1F,2E0F24).

El resultado es un poco mas lindo a mis ojos, pero sobre gustos no hay nada
 escrito...

!["intento con paleta personal"](/data/pi_M.png)

## ¿Conclusiones?

Las conclusiones se las dejo a los matemáticos y la _data visualization_ es mucho
 mejor con la ayuda de algún diseñador, aunque (en palabras del maestro):

> "The nature of form in the digital age is trapped in the realm of code." 
>>   John Maeda.

## Código

Subí esta cosa a [github](https://github.com/MarxBro/pi_plot) por si hay algún remoto interés...

Si alguien tiene ganas de _paletear la idea mas estéticamente_ es __mas que
 bienvenido__.

Hay muchas herramientas para generar paletas, yo (que no soy diseñador ni nada) 
 usé [esta y la recomiendo](https://color.hailpixel.com/).



