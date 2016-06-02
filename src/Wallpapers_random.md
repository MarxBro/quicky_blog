# Fondos aleaatorios (a.k.a random wallpapers)

Esta es una simple idea que tuve una vez y a partir de ahí lo vengo usando.

Creo que tiene más sentido si se usa un gestor de ventanas minimalista (como __dwm__).

## Entonces

La idea es más o menos así: 

* Los posibles fondos de pantalla (desde ahora _wallpapers_) residen en una carpeta cualquiera.
* Un script simple, elige aleatoriamente alguna imágen.
* Mediante un programa externo (__hsetroot__, __nitrogen__...) lo pone como fondo del "escritorio".



    DIR_WALLS=( `echo /mnt/Imagenes/Walls/*.{jpg,png,jpeg,JPG,JPEG,PNG}`)
    Lista(){
        for i in ${DIR_WALLS[*]}; do
            echo "$i"
        done
    }
    [ $1 ] && Lista | column && exit 0
    hsetroot -fill "${DIR_WALLS[$RANDOM % ${#DIR_WALLS[*]}]}" &&
    exit 0




Como yapa le agregué una posiblidad de _listar_ todos los posibles wallpapers...

## Además

Opcionalmente el script se ejecuta en el startup de bash, o incluso puede ser solamente una funcion dentro del bashrc que se ejecuta desde ahí...

> Queda a criterio y discreción del usuario... o algo así.

Zaijian.
