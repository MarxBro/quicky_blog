# Copiar recursivamente (ciertos archivos)

Todos tuvimos alguna vez esta necesidad y pasamos por el mismo problema...

> ¿Cómo era esa opción de _find_ después de la pipa y el ls?

__La idea es agarrar todos los archivos de cierta extensión, en un árbol de carpetas, subcarpetas, archivos...__

Quería mostrar dos formas que a mí me sirvieron (y de paso me quedan anotadas en algún lado) que _NO requieren find_.

_Sep, no somos "find friendly"..._

## Copiar archivos de cierta extensión, respetando el esqueleto de carpetas

Ditto. Este incluye subdirectorios:

	rsync -avm --include='*.extension' -f 'hide,! */' . /destino

Nótese que la carpeta "destino" debiese ser creada previamente, o reemplazada por el path actual con el punto (se entiende, no?).

## ¿Y sólo los archivos?

Usando la opción del shell __globstar__ podemos hacer que _**/ expanda a directorios y subdirectorios, permitiendo que después *.extension expanda correctamente a cualquier archivo de esa extensión_. 

	shopt -s globstar
	cp **/*.extension destination_dir

A veces la opción _globstar_ no está configurada desde el inicio pero si en cambio lo está, el primer comando no es necesario (ya que justamente hace eso).


> Golazo!
