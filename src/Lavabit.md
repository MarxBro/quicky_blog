# Lavabit

El caso de _Lavabit_ es bastante conocido por todos, acá va un resumen poco
inspirado, pero tiene algo de testimonial ya que __yo tuve una cuenta en
Lavabit__.

!["El logo de la difunta compañía"](/data/Lavabit.png)


## Un poco de historia

Había una vez un proveedor de correo electrónico que creó el código 
fundacional de su empresa en base a la privacidad como eje, presupuestado
tecnológicamente por la encriptación de los archivos de sus clientes (y con base en EUA).
Un día, mientras todo iba normalmente bien, la NSA le pidió acceso al contenido
de los mensajes de sus clientes, cuyas casillas estaban encriptadas por una
llave personal, que residía en el servidor de la compañía.
Si bien este método no es (ni remotamente) el más seguro, tenía una gran
ventaja: Cada usuario tiene una llave personal que decripta su inbox cada vez
que ingresa a su cuenta, y solamente mediante esa llave es posible leer esos
mensajes.

El gobierno quería leer puntualmente los mensajes de Edward Snowden, quien
tenía una casilla de mensajes en ese servidor. El NSA (la agencia nacional de
seguridad yanqui), necesitaba la llave para poder leer (y posteriormente
juzgarlo en base a) el contenido de esos mensajes. Ladar Levison se negó a
cooperar (el dueño de lavabit) alegando que eso simplemente violaría el principio
fundacional de su compañía, además de la ética profesional y los derechos
ciudadanos...

Antes de cooperar (como aparentemente hacen __todos__ los demás proveedores de
mail), __decidió cerrar su empresa, que había estado funcionando desde el
2004__.

## ¿Y a mi qué?

El motivo de este artículo _no es_ contar nuevamente esta vieja historia, sino
remarcar que el __código fuente está disponible en github__.

Son tres repositorios, yo los cloné así:

    mkdir LAVABIT_SRC && cd LAVABIT_SRC
    git clone https://github.com/lavabit/magma
    git clone https://github.com/lavabit/libdime
    git clone https://github.com/lavabit/messages

Todo __pesa alrededor de 100 MB__ y _tarda un rato_ en clonarse...

La librería _dime_ y puntualmente __magma__ son la plataforma y el software en sí mismo, los
mensajes son.. __Mensajes!!!__ (encriptados).

Lo más interesante de todo el paquete es __magma__ el daemon servidor de correo que implementa la
encriptación directamente en su núcleo, como parte del proceso general.

_En estos días lo voy a estudiar en detalle, a ver qué aprendo_...

Zaijian!



