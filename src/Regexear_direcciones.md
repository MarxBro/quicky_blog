# Regexear direcciones de correo

Hace poco y por razones "non-sanctas" que no puedo divulgar demasiado (digamos que
algunos sys-admin estatales duermen la siesta), conseguí una serie de archivos
que tenían cierta información; de esa data, me interesaban las direcciones de correo
allí presentes.

Entonces fui armando una de esas "pipeadas bashisticas", que quedo
mas o menos así:

    cat *.txt |  egrep -o "\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b" |
    sort | uniq

Gol!
