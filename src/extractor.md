# Extraer cualquier tipo de archivo

Abajo dejo un script que encontré por ahí y corregí un poco,
 agregando o sacando cosas, que _extrae cualquier tipo de archivo_.

No puedo hacerle mérito a quién lo creo, porque ni me acuerdo: estaba entre unos
 archivos viejos de una vieja máquina.

No importa si es __zip__,__gz__,__lzma__... Este script encuentra la aplicación
 correcta y extrae el contenido.

Es capaz de extraer pdf y odt también...


    #!/bin/bash
    
    # CWD por defecto
    exdir="."
    
    _unzip() {
    	unzip "$1" -d "$exdir"
    }
    
    while [ -n "$1" ]; do
    case "$1" in
    
    "-h")
    	echo "Uso:  EXTRAE.sh [-D dir] [files]
        -D dir   Carpeta de salida
    	exit 0
    	;;
    "-D")
    	shift
    	exdir="`readlink -f \"$1\"`"
    	;;
    -*)
    	# switches
    	;;
    *)
    	break
    	;;
    esac
    shift
    done
    
    while [ -n "$1" ]; do
    
    bfn="${1##*/}"		# base file name
    fn="${bfn%.*}"		# without extension
    exfn="${exdir}/${fn}"	# base file in output dir
    lcbfn=`echo "${1##*/}" | tr "[:upper:]" "[:lower:]"`;	# lower case base file name
    apn=`readlink -f "$1"`	# absolute path name
    
    
    case "$lcbfn" in
    *.tar)
    	tar -C "$exdir" -xvf "$1";;
    *.tgz|*.tar.gz|*.dsl)
    	tar -C "$exdir" -xvzf "$1";;
    *.tbz2|*.tar.bz2|*.tbz)
    	tar -C "$exdir" -xvjf "$1";;
    *.tar.z|*.taz)
    	tar -C "$exdir" -xvZf "$1";;
    *.z)
    	if [ "`pwd`" = "$exdir" ]; then
    		uncompress "$1"
    	else
    		uncompress -c "$1" > "${exfn}"
    	fi;;
    *.gz)
    	if [ "`pwd`" = "$exdir" ]; then
    		gunzip -dv "$1"
    	else
    		gunzip -dcv "$1" > "${exfn}"
    	fi;;
    *.bz2)
    	if [ "`pwd`" = "$exdir" ]; then
    		bunzip2 -dv "$1"
    	else
    		bunzip2 -dcv "$1" > "${exfn}"
    	fi;;
    *.arj)
    	arj e "$1" "$exdir";;
    *.lzh|*.lha)
    	lha -xvw="$exdir" "$1";;
    *.rar)
    	unrar x "$1" "$exdir";;
    *.zip|*.wsz|*.xpi)
    	_unzip "$1";;
    *.odt|*.ods)
    	_unzip "$1";;
    *.docx|*.pptx|*.xlsx)
    	_unzip "$1";;
    *.jar)
    	if [ -x "`which jar`" ]; then
    		jar -xvf "$1"
    	else
    		_unzip "$1"
    	fi;;
    *.zoo)
    	if cd "$exdir"; then
    		zoo x "$apn"
    		cd -
    	fi;;
    *.deb)
    	dpkg -X "$1" "$exdir";;
    *.rpm)
    	if cd "$exdir"; then
    		rpm2cpio "$apn" | cpio -vid
    		cd -
    	fi;;
    *.7z)
    	7zr x -o"$exdir" "$1";;
    *.cab|*.msi)
    	cabextract -d "$exdir" "$1";;
    *.ace)
    	if cd "$exdir"; then
    		unace e "$apn"
    		cd -
    	fi;;
    *.ha)
    	if cd "$exdir"; then
    		ha xa "$apn"
    		cd -
    	fi;;
    *.alz)
    	unalz -d "$exdir" "$1";;
    *.arc|*.ark)
    	if cd "$exdir"; then
    		nomarch "$apn"
    		cd -
    	fi;;
    #*.uha
    #	dosemu uharcd.exe x -t"$exdir" "$1";;
    #*.dar
    #	true;;
    *.a|*.ar)
    	ar xo "$1";;
    *.iso)
    	exdir="$exdir" unpack-iso "$1";;
    thumbs.db|ehthumbs.db|thumbcache_*.db)
    	vinetto -o "$exdir" "$1";;
    *)
    	mime="`file -i "$1"`"
    	case "$mime" in
    	"application/x-zip")
    		_unzip "$1";;
    	*)
    		echo "unpack: Unknown compression type." >&2
    		file -k "$1" >&2;;
    	esac;;
    esac
    shift
    
    done
    
    exit $?

Alcanza con copiar las líneas de arriba, bautizar el nuevo archivo y 
 colocarlo en algún lugar del path.

Generalmente, no lo uso. La mayoría de las cosas que bajo son del tipo 
 __tar.gz__, aunque eso no significa que eventualmente encuentr algún archivo
 interesante para descomprimir y no me acuerde bien cómo era...

 ![XKCD](http://imgs.xkcd.com/comics/tar.png)


