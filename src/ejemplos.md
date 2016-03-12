# Este CMS

Toda esta página está hecha en base a un CMS estático que programé 
en mi tiempo libre. Era un proyecto de una hora... llevó unas cuantas mas,
durante las cuales me fui encariñando con el programa.

# ¿Me lo puedo bajar?

Si, claro.

Está en [github](https://github.com/MarxBro/quicky_blog) y necesita algunos módulos de Perl 
que no suelen ser parte del core (pero que se instalan fácil con [cpanp](/cpanp.html)):

* File::Find::Rule
* Text::Mardown
* List::MoreUtils
* File::Slurp

## ¿Qué es lo que hace?

Básicamente, genera páginas HTML en base a archivos markdown y las indexa.

El índice no es gran cosa, pero funciona y después simplemente enlaza a 
los recursos embebidos/incrustados en las páginas individuales.

## ¿Cómo se usa?

Fácil. En la carpeta __src__ van los artículos en formato markdown, el css y lo 
que sea que vaya a para a la página.

Se compila con la opción __b__ y se recrea el sitio con todo su contenido en la 
carpeta -nueva- bautizada como __"build_fecha"__.

Las imágenes a incrustar en las páginas puntuales de los artículos van a parar a
la carpeta -nueva también- __"build_fecha/data"__ y desde ahí se incrustan 
mediante un enlace markdown.

Le agregué disqus, como un adicional optativo (para incluir comentarios) y es el
único "cacho de js" que usa hasta ahora.

Es bastante transparente.

## ¿Porqué es estático?

Porque así es mejor...

Es más rápido y más portable: literalmente, el texto HTML no tiene porque ser 
pesado; lo mismo aplica al css y las imágenes son quizá la excepción (y hasta 
ahí).

Es más seguro ya que no hay código expuesto (con la excepción de disqus).

Y por último, es __suficiente__ para lo que quiero decir, tengo en mente y
espero de este proyecto.

## ¿Es responsive?

Una página en HTML plano con el menor css posible, sin artificios de
imágenes en el fondo, fuentes o recursos "jquerísticos" adicionales suena 
[lo suficientemente responsive](http://motherfuckingwebsite.com).


