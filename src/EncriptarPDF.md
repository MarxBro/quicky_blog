# Encriptar un pdf

Esto va a ser rápido...
	
    qpdf -encrypt password password-admin 40 -print=n -- pdf_original.pdf pdfEncriptado.pdf

Es obviamente necesario [qpdf](http://qpdf.sourceforge.net/).

> Un apunte...
