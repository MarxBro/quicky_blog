# Dados, alias y script

Los dados son muy viejos y sus orígenes inciertos; la evidencia más antigua que
 tenemos de ellos se remonta a la antiquísima ciudad de Ur (Sumeria creo que se
 le dice a esa zona de Iraq).

Para los detalles, está wikipedia...

Me interesa la idea de traer los dados a la consola: ese es nuestro tema de hoy.

## La idea principal

Para obtener un número aleatorio entre 1 y 6, en la consola hay varias formas.

Entiendo que la más feliz es la que sigue, ya que no necesita lenguajes
 adicionales :

    echo $[RANDOM%6+1]


## Un poco de ayuda de perl

Con la ayuda de perl, podemos conseguir que repita una letra _X cantidad de
 veces_, acorde a la función random anterior... Ya se va pareciendo mas:

    perl -E "say ' o 'x $_" $(echo $[RANDOM%6+1] )

## Un alias

Lo dicho antes, se puede convertir en alias muy facilmente:

    alias dado       = 'echo $[RANDOM%6+1]'

## Más elaborado: ahora con interfaz

Este ejemplo que sigue, es interesante ya que propone una idea que no habíamos
 considerado hasta ahora: una interfaz.

No hay nada nuevo en la idea, ni nada complejo, pero la experiencia de tirar un
 dado es _un poco mas que conseguir el número que retorna como resultado_.

El ejemplo salió de un libro (creo), que en su momento anoté en mi _vimwiki_
 para después olvidarme del nombre. :P

No me acuerdo cual era, pero como es fácil de entender y divertido, me animo a
 poner el código fuente a continuación:

    #!/bin/bash
    pip=o                      ## character to use for the pips 
    p0="       "               ## blank line 
    p1=" $pip     "            ## one pip at the left 
    p2="   $pip   "            ## one pipe in the middle of the line 
    p3="     $pip "            ## one pip at the right 
    p4=" $pip   $pip "         ## two pips 
    p5=" $pip $pip $pip "      ## three pips 
     
    cs=$'\e7'                  ## save cursor position 
    cr=$'\e8'                  ## restore cursor position 
    dn=$'\e[B'                 ## move down 1 line 
    b=$'\e[1m'                 ## set bold attribute 
    cu_put='\e[%d;%dH'         ## format string to position cursor 
    fgbg='\e[3%d;4%dm'         ## format string to set colors 
     
    dice=( 
      ## dice with values 1 to 6 (array elements 0 to 5) 
      "$b$cs$p0$cr$dn$cs$p0$cr$dn$cs$p2$cr$dn$cs$p0$cr$dn$p0" 
      "$b$cs$p0$cr$dn$cs$p1$cr$dn$cs$p0$cr$dn$cs$p3$cr$dn$p0" 
      "$b$cs$p0$cr$dn$cs$p1$cr$dn$cs$p2$cr$dn$cs$p3$cr$dn$p0" 
      "$b$cs$p0$cr$dn$cs$p4$cr$dn$cs$p0$cr$dn$cs$p4$cr$dn$p0" 
      "$b$cs$p0$cr$dn$cs$p4$cr$dn$cs$p2$cr$dn$cs$p4$cr$dn$p0" 
      "$b$cs$p0$cr$dn$cs$p5$cr$dn$cs$p0$cr$dn$cs$p5$cr$dn$p0" 
      ) 
     
    clear 
    printf "$cu_put" 2 5               ## position cursor 
    printf "$fgbg" 7 0                 ## white on black 
    printf "%s\n" "${dice[RANDOM%6]}"  ## print random die 
     
    printf "$cu_put" 2 20              ## position cursor 
    printf "$fgbg" 0 3                 ## black on yellow 
    printf "%s\n" "${dice[RANDOM%6]}"  ## print random die 

El array de líneas _dice_, guarda el resultado que "dibuja" las caras de los dos
 dados y la parte aleatoria, viene dada por la variable _RANDOM_ de bash: tanto
 nuestro simple alias como este ejemplo mas complejo (y no tanto), están
 alimentados y reposan sobre el mismo método para obtener números aleatorios.
