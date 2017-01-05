# RADIO: Más y Mejor

Hace un tiempo hice [un script para escuchar la radio](https://3456.com.ar//La_Radio.html). Ahora traigo __una versión
 renovada de la misma idea__.

Básicamente, la idea es igual: una radio que funciona en base a mplayer y que nos
 deja elegir que escuchar en base a un archivo que funciona como lista de
 opciones, bla bla...

Encontré un buen lugar de donde bajar una lista -bastante- actualizada de urls
 de radios "estrimeando" música del mundo. Es bastante buena lista, un 45% de las
 radios funcionan (y ese __es un número muy respetable__).

## Entonces?

El script hace esto:

* baja el archivo (gigante, como 7 Megas),
* parsea la información relevante y le da el mismo formato que en el proyecto anterior.
* crea un nuevo archivo de opciones,
* ejecuta dmenu para la búsqueda y selección de la url __y__
* ejecuta mplayer con esa url como parámetro.

__La idea es muy simple y minimalista__. El problema es grande y único: _¿Cómo
 unificar ambos proyectos?_ Reformulo la pregunta, __¿cómo hacer un menú para
 miles de items?__

> Ja! Como no tengo la respuesta_ para eso con dmenu me entretengo...

## ¿Dónde esta?

Esta en el [mismo repo github](http://github.com/MarxBro/radio_bash), llamado **dmenu_radio.sh** o en este
 [gist](https://gist.github.com/MarxBro/9bf8bc4118d6bc4d8b583953873a46bd) ([raw](https://gist.githubusercontent.com/MarxBro/9bf8bc4118d6bc4d8b583953873a46bd/raw/0542c9375cd04d4d2aa52da7e016d955b59e9581/dmenu_radio.sh)).

## Notas

No se si los muchacho que hacen ese archivo están contentos que yo lo utilice así... Asumo que _somos gomías_.

La búsqueda no es del todo práctica, pero lo bastante efectiva por el momento: el desafío queda planteado (y te quiero ver haciendo una interfaz que se la banque!).

> Zaijian!

