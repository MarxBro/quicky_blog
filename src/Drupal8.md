# Ejecutar código en Drupal 8

Esto es más un machete personal que una explicación formal...

Necesitaba ejecutar código en un Drupal 8, código simple que no ameritaba ser
empaquetado como módulo ni formar parte de un release-script.

La solución fue -una vez más-, __drush__.  _Drush 9 es compatible con la API de D8_.

## ¿En dónde pongo el código?

Fácil, aunque nadie lo dice explícitamente... jiji, los drupaleros son bastante
particulares.

Hay que hacer un script php como cualquier otro y ponerlo dentro de la ubicación
del D8. En un hosting, la carpeta suele ser bautizada como "public_html" o
"web"...

## ¿Cómo se ejecuta?

Desde la carpeta root del sitio, ejecutar el script php con un comando mas o
menos así:

    drush9 -v scr script.php

A partir de acá hay mucha tela que cortar... 


## Notas sobre d8

Depende puntualmente de qué es lo necesitemos hacer con el Drupal, las 
clases que vamos a cargar.

Por ejemplo, para crear un nodo alcanza con poner esta línea al comienzo del
script:

    use Drupal\node\Entity\Node

Eso nos habilita el "namespace" Node... Ojo que no se pisen, hay muchos "Entity"
y habría que cargar solo los que vamos a necesitar.


Esto nos posibilita __crear un nodo en d8__ sin tener que llenar el formulario desde
el panel, bla bla. Para uno solo no es muy útil, pero __si son una serie de nodos,
se gana tiempo y vida__.

        $node = Node::create([
            'language'             => 'LANGUAGE_NONE',
            'type'                 => 'article',
            'title'                => $tt,
            'body' => array(
                'value' => 'probando este coso...',
                'format' => 'basic_html',
            ),
        ]);
        $node->save();

_Ese es un ejemplo, pero se pueden hacer otras cosas, como crear y organizar
taxonomías, agregar imágenes al nodo, cambiar un nodo preexistente, etc_. En
general, es ideal para realizar tares tediosas de carga/organización de
contenido.

## Debug

Para debuguear usando esta idea, conviene usar las bondades de drush:

    drush_log(print_r($node),'ok');

Esto imprime todo lo que hace a $node en un mensaje "ok" de drush, en la
consola, mientras el código se ejecuta.

> Útil! Bueno, maso...


