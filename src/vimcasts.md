# Vimcasts

Hace poco redescubrí el libro de Drew Neil: __"Practical Vim: Edit Text at the Speed of Thought (Pragmatic Programmers)"__ y 
aprendí mucho mas sobre _macros_ y _registros_. En general, no tengo mucho uso para ambas
funciones en lo cotidiano, pero un poco de magia en vim salva el dia del tedio.

El mismo autor tuvo una página en donde expllicaba como hacer ciertas cosas utilizando __vim__, en detalle y en video.
Muy instructivo el proyecto...

Buscando por ahí, vi que la página permite ver la lista json de los videos. Quiero creer que es voluntario y no un accidente u olvido...

De cualquier forma, me los bajé todos con estos comandos:


    mkdir vimcasts 
    cd vimcasts
    wget -O - http://media.vimcasts.org/videos/index.json 2>/dev/null | grep url | awk -F'"' '{print $4}' >> lista
    wget -i lista


Calculo que se pueden encadenar así, pero no lo probé:
	
	wget -O - http://media.vimcasts.org/videos/index.json 2>/dev/null | grep url | awk -F'"' '{print $4}' | wget -i

La carpeta donde lo hice me quedó bastante desordenada. Me gustaría ordenarla por fecha de creación del archivo o algo así.
Por suerte los videos está bien rotulados y el formato ogv es -para mi gusto personal- óptimo. Los renomré así:

	for i in *ogv; do mv $i $(ls -l $i | awk '{print $6 "-" $7 "-" $8}')_$i; done

Recomiendo el libro mencionado anteriormente, de lo mejor que leí sobre vim y editores de texto en general.
