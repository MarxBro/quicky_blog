# Bajar algunos wallpapers

No estoy seguro que tan legal es esto ni cuanto va a durar funcionando.

La idea es un comando simple para bajarse algunos wallpapers de la web.

Alguien se encargó de hacer un programa que se encarga de la tarea, 
 automatizando partes, permitiendo opciones y demás.

Se puede ver por [acá](https://github.com/geekspin/wallhaven-dl), está hecho en
 python y necesita algunos módulos adicionales.

Como _no tengo muchas ganas de instalarlos_, hice esto:

    #!/bin/bash
    N=$RANDOM
    NN=$(($N + 25))
    for i in $(seq $N $NN); do wget "https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-$i.jpg" --user-agent="Mozilla"; done

Anduvo joya y __con eso me alcanza__. La idea es interpolar un número en la URL,
y la API de wallhaven hace el resto...

> Zaijian!
