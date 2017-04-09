# Montar el iPhone

Lo escribo en algún lado así queda en la memoria colectiva (mía y de mí mismo).

_No hace falta jailbreakear el teléfono_ para poder montarlo, aunque algunos archivos no se van a poder modificar... 
Una vez "montado", es un dispositivo de memoria como cualquier otro. Este método deja hacer un par de cosas que son a menudo necesarias, __como mover las fotos fuera del teléfono__.

Es necesaria la librería [libimobiledevice](http://www.libimobiledevice.org/) y gvfs-afc. En Arch, se pueden instalar ambos así:

	pacman -S gvfs gvfs-afc libimobiledevice

Una vez instalado, conectar el teléfono a la compu y -lógicamente- "confiar en este dispositivo".

## Por último

Ejecutar:

	ifuse /mnt/iphone # o donde se quiera montar...

> Desmontar es fácil.
