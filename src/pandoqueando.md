# Pandoc y vim como entorno de escritura.

## Configuraciones para vim

Personalmente, prefiero escribir en __vim__. Casi todo lo que escribo hoy por
hoy, sale de vim.

![VIM es una marca de lavandina -o algo así- en mi país](/data/vim_limpiador.jpg)

_Bueno, me refería al editor de texto..._

En lo que se refiere configuraciones, me gusta que automáticamente
rompa la linea mientras escribo para evitar saltos de lineas o formateo
innecesario después de escribir el párrafo.

Eso se puede conseguir poniendo en el __.vimrc__ algo mas o menos como esto:

    " Hacer que la linea se vaya rompiendo al llegar a las 80 columnas
    autocmd FileType  markdown  set textwidth=80
    autocmd FileType  markdown  set formatoptions+=t

Tengo agrupados algunos otros comandos relacionados con las correcciones para
algunos tipos de archivo, que pueden ser útiles también:

    " (Giladas pa escribir mas felizmente) 
    augroup writer_Goodies
        autocmd FileType  markdown  set spell
        autocmd FileType  markdown  set spelllang=es
        autocmd FileType  markdown  set textwidth=80
        autocmd FileType  markdown  set formatoptions+=t
        autocmd FileType  vimwiki   set spell
        autocmd FileType  vimwiki   set spelllang=es
        autocmd FileType  text      set spell
        autocmd FileType  text      set spelllang=es
    augroup END

## Formateame el párrafo

Formatear el párrafo es simple, vim tiene un "formateador" interno. Con __gq__
en modo línea visual (SHIFT + v), alcanza para formatear la selección.

Con __gqip__ en modo normal se formatea todo el párrafo, sin necesidad de
selección.

## par

En general, la mejor idea es utilizar __par__ que ostenta opciones mas
inteligentes en aspectos como el manejo de citas, textos anidados y estilizar
acorde a formatos predefinidos; es mas, es capaz de tomar decisiones por sobre
el manejo de los espacios en blanco entre párrafos...

Por si no queda claro, [par](http://nicemice.net/par/) es un programa para Linux
y no se cuántos sistemas operativos mas, que sigue la filosofía del diseño de
aplicaciones Unix:

    Do one thing and do it well.  
    (Hacé una cosa y hacela bien.)

Para "bypassear" el formateador interno y reemplazarlo con par, alcanza con:

    :set equalprg=par

Vean la ayuda en vim, tiene muchas mas posibilidades que las pocas que yo enumero
acá:

    :help formatting

## Pandoc

[Pandoc](http://pandoc.org) es un programa hecho en
[Haskell](https://www.haskell.org) que convierte entre muchos formatos de texto.
Es de lo mejorcito en el tema, casi sin comparación.

Es un proyecto [muy bien documentado](http://pandoc.org/README.html). Tiene
paginas man también y generalmente se instala a través de __cabal__ (la forma
que recomiendo).  Cabal es el gestor de paquetes del lenguaje Haskell.

## Con la ayuda de make

Como esqueleto tengo un archivo __make__ para convertir un archivo markdown a
diferentes formatos de salida; muy a menudo lo termino copiando en la carpeta desde
la que escribo.

No necesariamente es igual de necesaria la salida en todos esos formatos: a
menudo solamente quiero el pdf o html. Sin embargo, están ahí disponibles...


    all: pdf odt html latex rtf manpage asciidoc opendocument
    
    pdf: 
	    pandoc doc_src.md -o doc.pdf
    
    odt:
	    pandoc -s doc_src.md -o doc.odt
    
    html:
	    pandoc -s doc_src.md -o doc.html
    
    latex:
	    pandoc -s doc_src.md -o doc.tex
    
    rtf:
	    pandoc -s doc_src.md -o doc.rtf
    
    manpage:
	    pandoc -t man -s doc_src.md -o doc.1
    
    asciidoc:
	    pandoc -s -S doc_src.md -t asciidoc -o doc.txt
    
    opendocument:
	    pandoc doc_src.md -s -t opendocument -o doc.xml
    
    clean:
	    rm doc.pdf doc.html doc.odt doc.tex doc.1 doc.rtf doc.xml doc.txt

Por si interesa, habría que copiar el código anterior y bautizar el nuevo
archivo como __Makefile__ (sin extensión). Seguramente __make__, uno de los
programas mas antiguos y venerables del entorno *nix, ya esté disponible. Editar
a gusto las saidas y formatos (probablemente rtf no sea tan útil como pdf o
html).

El makefile busca un archivo llamado "doc_src.md" y realiza las conversiones en
los formatos listados arriba. Usarlo es fácil, simplemente hay que entrar en el
directorio y:

    make

eso es todo...

Recomiendo hacerse amigo de __make__ que no solamente es funcional para los
programadores en C...

