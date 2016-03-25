# Grabando el escritorio y otras cosas

Estos son alias, que tranquilamente pueden ser comandos, que sirven para grabar
o reproducir usando los dispositivos de la notebook, en mi caso.

## Grabar el Escritorio

    alias RECORDMYDESKTOP_FFMPEG='ffmpeg -f alsa -i hw:0,0 -f x11grab -r 25 -s 1024x600 -i :0.0 -vcodec libx264 -threads 0 -ac 2 video.mkv'
   
   
## Grabar el Micrófono
  
    alias GRABAR_MIC='arecord -v -f cd -t raw | lame -r --preset extreme - output.mp3'

## ASCII Cam

    mplayer -vo caca tv://

## Foto con la webcam

    alias PIC__='ffmpeg -y -r 1 -t 3 -f video4linux2 -vframes 1 -s vga -i /dev/video0 ~/webcam-$(date +%m_%d_%Y_%H_%M).jpeg'

Podrían no andar igual de bien en todos los casos...

En general, ilustran un poco el poder de herramientas como __ffmpeg__ y __mplayer__.

Para capturar la pnatalla, existe __scrot__.
