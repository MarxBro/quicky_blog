# Comandos mas usados

La idea es así: un comando para armar un ranking de los comandos mas usados (o
 repetidos).

    history | awk '{ print $2 }' | sort | uniq -c | sort -n -r | head

Sin frecuencia de aparición, se consigue de la misma manera, pero hay que
 quedarse con la segunda columna:

    history | awk '{print $2}' | sort | uniq -c | sort -n -r | head | awk '{print $2}'

Me interesa saber si hay una forma mas eficiente o feliz de conseguir lo
 mismo...
