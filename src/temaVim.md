# Un tema para Vim

[Este](https://github.com/MarxBro/marxbros_vim_theme) es un intento de tema minimalista para vim.

Como uso mayoritariamente C y Perl y no soy muy fanático de
 los colorines, es muy sutil la coloración.
 
Agregué un cambio de fg para el formato POD (documentación de Perl). 

## Util

Para debuggear y agregar definiciones de colores, se puede usar algo así.

    " Mostar a que grupo de sintaxis corresponde
    " con shit + Ctrl + P
    nmap <C-S-P> :call <SID>SynStack()<CR>
    function! <SID>SynStack()
        if !exists("*synstack")
            return
        endif
        echo map(synstack(line('.'), col('.')),'synIDattr(v:val, "name")')
    endfunc

> Esta idea la saqué de un vimcast.

Se ve más o menos así:

!["Ejemplo de como se ve en mi netbook"](/data/vt.png/)

En el ejemplo se ven las ideas principales (que responden a mis preferencias):

* Los _números de línea_ a la izquierda están en negro y _casi no se ven_.
* Las líneas de código __no cambian de color__, sino que
* Solamente las variables están en __negrita__.
* La documentación _no aparece como un comentario_, sino que 
* (La documentación) __aparece como código pero en otro color__.
* _Los comentarios están invertidos_ respecto a los colores del código.
