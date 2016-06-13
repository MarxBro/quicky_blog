# Bajar mp3 desde Youtube

Con __youtube-dl__ se hace fácil:

    youtube-dl -x --audio-format mp3 --audio-quality 8 "https://youtube.com/?v=87234872346" # el link es inventado... 

El link se consigue yendo directamente a la página del video y copiando la URL.

Si son varios, conviene ponerlos en un archivo txt uno por línea y usar un comando más o menos así:

    for i in $(cat mptez); do youtube-dl -x --audio-format mp3 --audio-quality 8 $i; done

Zaijian!
