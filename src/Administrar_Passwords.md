# Administrando passwords

Voy a re-implementar mi sistema de guardado y organización de contraseñas; todavía no tengo del todo claro cómo lo voy a estructurar, pero acá van algunas ideas sueltas. Mas o menos el camino futuro se va a ir definiendo en base a un archivo de texto plano, encriptado y decriptado _ad libitum_.

# Encriptar

Uno de mis nuevos mejores amigos es este maravilloso programa: __ccrypt__ (buscarlo así en arch y cia.).

Para encriptar un archivo de texto plano, alcanza con:

	ccencrypt archivo

Para decriptarlo, similarmente:

	ccdecrypt archivo.cpt

Nótese que cambia la extensión... Es bastante mas útil este otro comando, que emula al venerable _cat_:

	ccat archivo.cpt

Nos permite así, hacer algo como esto:

	ccat archivo.cpt| grep gmail

# Generar passwords aleatorios.

Ditto. La idea es simple, aunque mi idea es no complicarme demasiado con la generaciópn aleatoria.

Sabía esta forma de conseguir un string aleatorio en base32 mediante openssl:
 
	openssl rand -base64 32

Algo así (o mejor) se puede hacer mediante las bondades de bash y conseguir una contraseña pseudo-aleatoria.

	</dev/urandom head -c8 | md5sum

Base32 y md5sum es únicamente una idea para tener un formato común en los
 passwords y asegurarse que nadie sea del todo capaz de recordar.


## Continuará

Eso. Vamos hasta acá por ahora, sé que hay millones de formas mejores de conseguir passwords aleatorios y merecen mayor exploración.

Un capítulo muy importante en este tema es la ubiquidad: cómo sincronizar este archivo?

En teoría, uno podría "tirar" en Dropbox o algo así, el archivo encriptado... 
 Creo que también es feliz usar rsync e incluso ponerlo en /etc en el server y dejar que el bueno de etckeeper se encargue de mandarlo al repo.

Ahora, me gustaría tenerlo disponible en el teléfono también... __este es el próximo paso__.
