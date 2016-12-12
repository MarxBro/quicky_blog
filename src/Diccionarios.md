# Diccionarios: recopilando

Es vox populi que /usr/share/dict/words contiene una lista de palabras... Aunque ese archivo la mayor parte del tiempo no existe.

Entonces, armé un pequeño repo con "palabras". No es una inciativa tan _romántica_ como suena, simplemente tenía algunos archivos por ahí y los agregué a [un repo en github](https://github.com/MarxBro/dicts). 

> Pull-requesteen a gusto...

Mi idea, creo que es útil y por eso la comparto, es poblar /usr/share/dict/ con diccionarios y listas de palabras clasificadas (mas o menos) criteriosamente...

## Lemario español

Párrafo aparte, "words" es una convención unix y como la mayoría de ellas pasa en inglés. ¿Cómo hacer un "words" en español?

Uno de los archivos mas significativos es el lemario, que sale de la iniciativa (que sí es romántica y quasi heroica) de [esta gente](http://olea.org/proyectos/lemarios/).

## Random words baby

Esto es parte de la idea, creo, ya que alguna vez vamos a necesitar alguna palabra aleatoria... no?

    shuf -n 1 /usr/share/dict/lemario-*.txt

Con **shuf** obtener una palabra aleatoria es muy fácil; pueden ser más cambiando el valor del argumento -n.

> Hacer el bien con estos archivos...
