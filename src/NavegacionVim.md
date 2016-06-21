# Navegación de Carpetas con VIM

Como ya deben saber, __vim__ es mi editor de cabecera (y el único  que realmente
 utilizo). Debatiendo sobre la superioridad de vim respecto a otros editores,
 salió el tópico de la navegación de archivos como un _punto negativo de vim_:
 carece de una herramienta para navegar las carpetas y se requeiere __NerdTree__
 (un plugin) para la tarea.

__Nada mas equivocado__.

NerdTree es muy bueno y facilita la tarea, pero __NO es indispesable__.

Vim tiene una herramienta llamada __netrw__ que se encarga de la tarea.

Para ejecutarla se usa el comando __:E__ (o :Explore).

Para cambiar la apariencia de los archivos y carpetas y lograr una vista similar
 a la que ofrece NerdTree hay que usar la __i__.

Si esto es de su preferencia, conviene agregarle al vimrc algo así:

    let g:netrw_liststyle=3

## Además

Se pueden crear, renombar, borrar archivos en el path (además de obviamente
 abrirlos para su edición). Estos son los comandos que conviene memorizar:

* __d__ : Crear nueva carpeta ("d" de "directory").
* __D__ : Borrar! ("d" de "Delete").
* __v__ : Abrir el archivo para editarlo en una ventana dividida verticalmente.
* __%__ : Crear un nuevo archivo y editarlo.


Yo generalmente uso __v__ seguido de __ctrl+w-=__ (o sea __CTRL__ y __w__ al mismo
 tiempo, seguido de un __=__) para redimensionar todas las ventanas al mismo
 tamaño (generalmente no son iguales por defecto).


Está lleno de comandos con se replican en opciones y posibilidades sobre las que se puede leer con presionar __F1__
 dentro de la ventana de navegación...

__VIM no carece de navegación, sino que tiene una muy poderosa que vale la pena
 entender__.

Zaijian!
