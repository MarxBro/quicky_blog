# Ploteando los decimales de Pi

Sin aparente razón o propósito mayor, se me ocurrió "plotear" 
(hacer un gráfico de) algunos decimales de pi.

## ¿Cómo obtener los decimales de pi en perl?

En general, no hice mucha matemática aplicada ni magia para obtenerlos: _usé
 la función pi de la librería bignum_, hice trampa...

Es más o menos así:

    perl -Mbignum -E 'say bignum::bpi(500)'

Lo que está arriba es un poco la génesis de todo, _obtener X decimales de pi con
 un comando_.

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

Hay fórmulas matemáticas brillantes para obtener los dígitos de _pi_,
 una de las más célebres se la debemos a __Ramanujuan__ (arriba en la imagen que
 sigue) y una aproximación mucho más precisa (que rompió el récord de cifras encontradas) es
 creación de los hermanos __Chudnovsky__ (abajo)

!["Fórmulas para obtener decimales de pi de matemáticos brillantes"](/data/ramchu.png)

Me queda como materia pendiente, plotear pi mediante esas fórmulas para ver los
 diferentes resultados... __Es una promesa__.

## ¿Cómo se ve el resultado?

El programa es bastante tosco y simple, es un script (obviamente en perl) 
 que básicamente ilustra los primeros 500 decimales de pi usando _Imager_ y
 _bignum_.


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

# Un poco más...

Agarrando 500 decimales, ya alcanzaba, pero ¿qué pasa si uso 10,000? __Lo mismo__...

!["intento con paleta personal"](/data/pi_M_10000.png)

Estaría bueno cambiar los colores por algunos de mejor gusto... :P

## ¿Y con 10000 y un único valor?

Claro, esto es lo que se viene... todos lo sabíamos.

¿Qué gráfico se obtiene si tomamos solo los unos, dos ... y el resto en
 blanco? Algo mas o menos así (ordenados de 0 a 9, de arriba hacia abajo):

!["solo 0s"](/data/0pi.png)

!["solo 1s"](/data/1pi.png)

!["solo 2s"](/data/2pi.png)

!["solo 3s"](/data/3pi.png)

!["solo 4s"](/data/4pi.png)

!["solo 5s"](/data/5pi.png)

!["solo 6s"](/data/6pi.png)

!["solo 7s"](/data/7pi.png)

!["solo 8s"](/data/8pi.png)

!["solo 9s"](/data/9pi.png)

Se pueden ver claramente varias cosas, que no necesariamente significan nada
 (estamos jugando a la matemática un poco):

* El mayor grupo de decimales repetidos (dentro de los primeros 10000) es de 4.
* Las líneas verticales solo aparecen por la disposición, así que no significan
  mucho; de todos modos, aparecen muchas...
* Aparecen algunas piezas del tetris en el 8 :P


## ¿Conclusiones?

Todo lo anterior es una idea, una inquietud y un poco de trabajo, ínfimo en
comparación con el que hacen los matemáticos en el día a día: la idea de todo
esto es, como dije antes, jugar a la matemática -un poco-.

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



