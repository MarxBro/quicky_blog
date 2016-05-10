# Encriptar archivos con OpenSSL

Se puede __encriptar cualquier archivo de texto con OpenSSL__. Creo que hay varias formas, pero esta que voy a mostrar es la que yo uso.

## Necesitamos una llave

Fácil, __se puede generar así__:

    openssl genrsa -out llave.txt 2048

El comando de arriba genera una llave RSA de 2048 bits y la guarda en el archivo "llave.txt".

_No es una buena idea que la llave se llame simplemente llave!_

## Ahora a encriptar

Para encriptar usando la llave anterior, es más o menos así:

    echo 'Contraseña Home Banking: ksksksksk123@~' | openssl rsautl -inkey llave.txt -encrypt > salida.bin

La primera parte de la pipa puede ser reemplazada por un archivo preexistente, mediante cat o '< archivo'.

  
## ¿Y para decriptar?

Fácil también...

    openssl rsautl -inkey llave.txt -decrypt < salida.bin


## Notas

Se puede encriptar usando cualquier archivo como llave y mediante otros programas, yo hice uno pòr ahí en Perl, muy simple.
