# La Radio

Por si interesa, dejo mi script para escuchar [radio en streaming](https://github.com/MarxBro/radio_bash) .

Las URLS las recopilé de varias fuentes que ya ni recuerdo...
Posiblemente fallen muchas, pero son tantas que mucho no me preocupa.

## Novedades

Estuve escribiendo una interfaz (aka GUI) en __C__, utilizando la vieja y
 querida librería __ncurses__.

 > Pasen y vean...

Por el momento es bastante _buggy_, aunque funciona y mucho de los bugs que
 tiene se deben a las radios cuyas urls no resuelven o no reponden como
 deberían...

Esta en el master del mismo proyecto, y el branch en el que estuve jugando se
 llama __GUI__.

!["Una interfaz para la radio"](/data/radio_gui.png)

No es gran cosa, sale de un ejemplo de la documentación oficial de ncurses y
 es un menú buffer con título y descripción que _ejecuta__mplayer__ de fondo_.
