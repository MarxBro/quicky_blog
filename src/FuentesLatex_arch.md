# Listar las fuentes Latex en Arch

Quería usar alguna fuente sans-serif para un documento escrito en markdown, que va a
 ser un pdf mediante la conversion latex por la gracia de pandoc. El tema es
 _cómo cambiar la fuente default de esos pdfs_.

No es que no me guste, pero no estaba precisamente escribiendo un paper y en
 LaTex, __todo se ve como un paper__... 

Los archivos .sty están en:

    ls /usr/share/texmf-dist/tex/latex/psnfss/*.sty

Están en varios lugares, divididas en el árbol de carpetas latex...

    ls /usr/share/texmf-dist/tex/latex/pxfonts
    ls /usr/share/texmf-dist/tex/latex/qfonts

Hay que encontrar una que vaya como trompada o quedarse con la default, _para
 todo lo demás existe Lyx, TeXMate and so on..._

En mi caso, a mi me gusta __palatino__ para esta ocasión.

La idea es _decirle a pandoc que dumpee la configuración por defecto para un
documento LaTex_ en la consola. Es fácil,así:

    pandoc -D latex > dumplatex

Después vamos a editar el archivo "dumplatex" y cambiar en el comienzo:

    s/lmodern/palatino/

Es decir, _hay que cambiar la primer aparición de la palabra "lmodern" por "palatino_.

Y, por último, decirle a pandoc que use esa información en reemplazo del
 template por defecto. 

    pandoc -f markdown -t latex --template=dumplatex source.md docfinal.pdf
 
Nuestro template es igual, y lo único que cambiamos es la
 fuente así que va a andar; pero no hay porqué quedarse únicamente con la fuente
 y se pueden cambiar otras cosas a gusto y necesidad de cada uno: a mi me alcanza
 con la fuente (por ahora).

> Eso es todo amigos... ¿Cada vez menos, no? Ja!
