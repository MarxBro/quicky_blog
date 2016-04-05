# AUTOCD

Cuando hay que cambiar mucho de carpetas en el shell, hay atajos
 archi-conocidos, como __-__ que cambia al penúltimo directorio utilizado o
 __.__, que representa el directorio actual y nos evita escribir (o expandir) el
 nombre completo de la ruta.

En algunos casos, se puede usar una combinación de __push__ y __pop__ para armar
 un stack y cambiar de carpeta acorde a lo que necesitamos. 

La idea de un stack no es la más práctica a mi parecer, ya que en el flujo de 
 trabajo es mas fácil olvidarse qué es lo que hay ahí dentro que mantenerlo en 
 _nuestra memoria ram_; además es común salirse de los directorios relevantes 
 para resolver una tarea o problema secundario, lo que necesitaría su propio stack...

Bash tiene otro as bajo la manga: la opción __AUTOCD__.

Este _shopt_ (shell option), recibe nombres de directorios como si fueran
comandos y los pasa como argumentos al programa __cd__.

Entonces, ya _no es necesario escribir cd a cada rato_ y __alcanza con escribir
solamente el directorio__:

    carpeta1            # equivale a "cd ./carpeta1"
    /home/yo/carpeta2   # equivale a "cd /home/yo/carpeta2"

Yo lo tengo como alias y lo invoco cuando lo necesito:

    alias AUTOCD='shopt -s autocd'

Puede volverse engorroso si los directorios tienen nombres que por alguna razón-
 coinciden con nombres de programas, pero en un día normal __es un aliado__.
