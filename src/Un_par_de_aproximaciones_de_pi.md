# Un par de aproximaciones de pi

Nuevamente hablando de _pi_...

Esta es una aproximación milenaria, atribuída a [Liu Hui](https://en.wikipedia.org/wiki/Liu_Hui), un gran matemático chino que vivió
en siglo 3 de nuestra era.

Quiero mostrar [esta remarcable fórmula](https://en.wikipedia.org/wiki/Liu_Hui's_π_algorithm#Quick_method):

!["Aproximación de Liu"](/data/liu.png)


Después hubo muchas derivaciones de la misma y en su base se deben a la sistematización del cálculo de la
cuadratura del círculo en función de polígonos de muchos lados (a mayor lados, mayor precisión).

No es precisamente una buena aproximación si tenemos en cuenta los estándares de hoy, pero nada nos
prohibe implementarla. En Perl, se ve mas o menos así:

	perl -E "say 768*sqrt(2-sqrt(2+sqrt(2+sqrt(2+sqrt(2+sqrt(2+sqrt(2+sqrt(2+sqrt(2+1)))))))))"

El resultado es:

	3.14159046323676

Comparado con los decimales que conocemos hoy:

	3.1415904632367
	3.1415926535897

Tiene 5 posiciones correctas después de la coma...

Sigue siendo mejor que la que única que yo recuerdo (la raíz quinta de 306):

	perl -E "say 306**(1./5.)"

	3.14155223581855
	3.1415926535897

En fin, mucho cuidado con Liu que _mantuvo el record de precision por casi 1300 años!_.

