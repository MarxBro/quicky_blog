# Juguete blogueador

Un blog system que voy haciendo en el tiempo libre.

Para compilar:

```bash
./bloggy.pl -b
```

La gilada va en src y se crea la carpete "buildfechafecha".

Hasta ahora soporta imágenes, código y archivos, por la gracia del markdown.

Los archivos para descargar van en la carpeta "src/dwns" y se vinculan desde ahí
mediante el markdown (a.k.a links).

Creo que no va a soportar mucho mas.

## Disqus

Crear un foro con el nombre de la pagina que el sistema se encarga de crear los threads que sean necesarios!

## El tiempo cambia todo...

Hay unas cuantas opciones que no hacen del todo feliz la adaptación de este engine en un blog por separadao...

Me quedaría limpiarlo y convertirlo en algo mas general (como para ocmpartirlo con el mundo). Pero por el
 momento no hay mucho interés y se queda así. _Avísenme si es requerido por alguien!_


Hay un bug en el módulo de markdown: evitar el código después de una lista (ul> li).
