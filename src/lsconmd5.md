# Un ls con md5

El programa que sigue, lo fui dejando en distintos lugares a lo largo del
 tiempo, y ha sido un poco abandonado... Es uno de los primero script �tiles que
 hice, hace como 6 o 7 a�os.

Lo retom� hace poco ya que se mezclaban versiones de archivos iguales en una de
 la carpetas donde trabajo, bla bla.

La idea es un _ls en esteroides_, que permita ver claramente los _hashs md5_ de
 los archivos en "donde estoy parado" y que sea _permeable a expansiones en el
 nombre de los archivos_ (igual que como ls es).

Por ejemplo, con __ls__ uno puede hacer:

    ls *.txt

para ver una lista simple de los archivos cuya extensi�n es "txt".

Con este programa tambi�n!

En general, un hash md5 por archivo, en una carpeta donde hay muchos, no es una
buena idea en lo que se refiere al tiempo... Pero en el caso en el que yo lo
necesitaba, no me preocupaba mucho: ten�a ese tiempo disponible a ser
sacrificado en aras de una buena e inequ�voca rotulaci�n.

Adem�s, no es necesario repetir la operaci�n:

    LS.pl '*.iso' >> MD5.sum

Despu�s _se ven los r�ditos_:

    grep '234fmg' MD5.sum | awk '{print $1}'

Se puede encontrar [aca](/dwns/LS.txt).
