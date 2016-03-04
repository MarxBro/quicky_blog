# git branch

Para crear un nuevo branch en git, desde el branch actual, hay que:

    git checkout -b nuevoBranch

A partir de ahí se copian todos los archivos del branch en dónde 
estábamos parados en el "nuevoBranch".

Nota: ahora hay que "pushear" y "pullear" al "nuevoBranch" y no a __master__.

    git push origin nuevoBranch
    git pull origin nuevoBranch

Para saber en que branch estamos parados, alcanza con:

    git branch


