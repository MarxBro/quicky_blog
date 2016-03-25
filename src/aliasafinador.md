# Afinador guitarrístico

Para afinar la guitarra, uno normalmente se compra un afinador, no?

Podría no hacer falta, hay algunos muy buenos programas y aplicaciones para el
teléfono, etc.

Acá abajo esta __el afinador que nadie necesita__... 

    for n in E2 A2 D3 G3 B3 E4;do play -n synth 4 pluck $n repeat 2;done

Yo lo tengo como un alias, mas o menos así:

    alias GUITARRA='for n in E2 A2 D3 G3 B3 E4;do play -n synth 4 pluck $n repeat 2;done'

No es el comando más elegante, ni el más útil, pero funcional (o mas o menos). 

Utiliza __sox__ y el algoritmo 
 [pluck](http://music.columbia.edu/cmc/MusicAndComputers/chapter4/0409.php)
 es el que le da ese "timbre de cuerda pulsada" (Karplus-Strong)...
