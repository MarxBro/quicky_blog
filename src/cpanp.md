# cpanp

Simepre comento que hay que instalar tal o cual módulo de Perl para hacer alguna cosa.

Alcanza con ejecutar el siguiente comando:
	
	cpanp i Nombre::Modulo

Recapitulando, hay muchas formas de instalar un módulo en Perl. Personalmente, usé __cpan__ 
(el sistema de instalación por defecto) un tiempo y siempre me pasaba que tardaba más tiempo
configurando que efectivamente instalando el módulo. Ni que hablar cuando es un sistema nuevo, 
remoto o con los módulos empaquetados y distribuídos por separado en el repo oficial de la 
distribución (escenario muy común).

Al día de hoy uso cpan-minus y simplemente lo recomiendo.
No requiere ninguna configuración para hacer el trabajo y 'funka'.

Los paths donde los móodulos residen son un asuento bastante oscuro y responden a 
diferenciaciones de antaño, que tenían sentido en la época en que Perl nació... Siempre
me dió esa impresión y siempre que necesité instalar módulos, me era difícil saber con 
anterioridad a dónde iban a parar los archivos que lo componían.

Un dato, los __::__ significan __/__. O sea, para el módulo 'File::Slurp', "File" es una carpeta y 
"Slurp.pm" el módulo que en ella reside...

Usando __perldoc__, podemos saber dónde fue a parar:

	perldoc -l File::Slurp # por ejemplo

También, y más productivo, podemos ver el código que lo compone. A veces es interesante lo que se 
puede encontrar cuando nos preguntamos "¿cómo hace este módulo para...?"
	
	perldoc -m File::Slurp

Es muy común que cpanp nos pregunta que hacer con las dependencias insatisfechas del módulo que nos
interesa instalar y nos muestre un menú que nos interroga:

* 1) Yes
* 2) No
* 3) Yes to All
* 4) Yes to all for this module

o muy parecido...

Como no tengo problemas de espacio en disco, siempre termino eligiendo la opcion 3.

Hay una forma de configurar cpanp, para que se guarde la molesta preguntita:

	s conf prereqs 3; s save

(Escribir lo anterior en el shell)

Otra opción importante a considerar es __--skiptests__, ya que por defecto siempre va a realizar las
pruebas de todos los módulos y a menudo son irrelevantes (si funciona File::Find, File::Find::Rule no tiene
razón para fallar y las pruebas no nos aportan mucha información, ni que hablar si simplemente estamos reinstalando
un módulo).

Una vez escuché por ahí:

	"CPAN es mi lenguaje; Perl es mi framework."

Y eso es todo por ahora...

