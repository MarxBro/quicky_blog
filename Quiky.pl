#!/usr/bin/perl
######################################################################
# Blog en un rato.
######################################################################

use strict;
use POSIX                   q/strftime/;
use Getopt::Std;
use Pod::Usage;
use autodie;
use feature                 qw/say/;
use File::Slurp             qw/read_file write_file/;
use Text::Markdown          qw/markdown/;
use File::Find::Rule;
use List::MoreUtils         qw/uniq/;
#use Data::Dumper            qw/Dumper/;

=pod

=encoding utf8

=head1 SYNOPSIS

Script para bloggear como un enfermo.

=cut

my $t_banana = strftime ("%d_%B_%Y_%H_%M_%S",localtime(time()));
my $t_manzan = strftime ("%d-%B-%Y %H:%M",localtime(time()));

=pod

=head2 Forma de uso:

=over

=item d | h     Debug. Ayuda.

=item b         Build (hacer tutti).

=back

=cut

my %opts = ();
my $debug = 0;

getopts('dhb',\%opts);
$debug++ if $opts{d};

# Configs
my $dir_build = "build" . "__" . $t_banana;
my $dir_src     = "./src";
my $dir_dwns    = "dwns";
my %linky       = ();

# Un pie al final de cada página
my $pie_html    = '<span>' . 'Última modificación: ' . 
                    $t_manzan . ' by <strong>MarxBro</strong>.' . '<a href="http://www.wtfpl.net/"><img src="/data/wtfpl.png" alt="MarxBro. WTFPL-2016" /></a>'
                     . '</span>';

#Favicon: Previene el error 404
my $favico_link_para_header = '<link rel="shortcut icon" href="favicon.ico"/>';

# C O M E N T A R I O S -> disqus.
my $comments_allow = 1; # Cambiar variables en la funcion embed_comments();

# S E O ( o algo asi )
my @keywords_fixed = ( qw /perl hack tecnologia vim linux git libre español administrador web redes free programación coding cool pi/ );
my $blog_autores = '"MarxBro"';
my $blog_desc = '"Blog personal acerca de linux, perl, tecnologías libres y la mar en coche."';

my $apache_target= 1; # poner en 0 si el servidor en nginx u otro.
my $htaccess = <<EOF
# Fijarse que el directorio desde donde se sirve el contenido tenga:
# AllowOverride All, o nada de esto va a andar.
Options -Indexes -FollowSymLinks

# compresion 
<ifModule mod_deflate.c>
  AddOutputFilterByType DEFLATE text/plain
  AddOutputFilterByType DEFLATE text/html
  AddOutputFilterByType DEFLATE text/xml
  AddOutputFilterByType DEFLATE text/css
  AddOutputFilterByType DEFLATE application/xml
  AddOutputFilterByType DEFLATE application/xhtml+xml
  AddOutputFilterByType DEFLATE application/rss+xml
  AddOutputFilterByType DEFLATE application/javascript
  AddOutputFilterByType DEFLATE application/x-javascript
</ifModule>

# cachetear
<ifModule mod_expires.c>
  ExpiresActive On
  ExpiresByType image/gif "access plus 1 months"
  ExpiresByType image/jpg "access plus 1 months"
  ExpiresByType image/jpeg "access plus 1 months"
  ExpiresByType image/png "access plus 1 months"
  ExpiresByType image/vnd.microsoft.icon "access plus 1 months"
  ExpiresByType image/x-icon "access plus 1 months"
  ExpiresByType image/ico "access plus 1 months"
  ExpiresByType application/javascript "now plus 1 months"
  ExpiresByType application/x-javascript "now plus 1 months"
  ExpiresByType text/javascript "now plus 1 months"
  ExpiresByType text/css "now plus 1 months"
  ExpiresDefault "access plus 1 days"
</ifModule>

EOF
;


my $div_return_home = '<div><a href="index.html">Volver</a></div>';

my $exitos = "Todo anduvo joya; en la carpeta " . $dir_build . " esta el blog.";

######################################################################
#                                                               Main
######################################################################
if ( $opts{h} ) {
    ayudas();
    exit 0;
} else {
    if ( $opts{b} ) {
        unless ( -d $dir_build ) {
            mkdir $dir_build;
            my $dir_b_css = $dir_build . '/css'; 
            my $dir_data_css = $dir_build . '/data'; 
            mkdir $dir_b_css;
            mkdir $dir_data_css;
        }
        build();
        say $exitos and exit 0;
    }
    else {
        ayudas() and die;
    }
}

######################################################################
#                                                           Funciones
######################################################################
sub ayudas {
    pod2usage(-verbose=>3);
}
# Funcion principal a.k.a. MAIN
sub build {
    my @pages   =   get_stuff($dir_src, '*.md'); 
    my @css     =   get_stuff($dir_src, '*.css');
    # Imagenes y cosas para linkear van a la carpeta data, 
    # hacer el link relativo: /data/img.png, etc.
    my @stuffs  =   get_stuff($dir_src, 'stuff');

    # Favicon: sin no existe, a fumarse el 404.
    if (-e './src/favicon.ico'){
        my $copy_favicon = 'cp src/favicon.ico ' . $dir_build . '/'. 'favicon.ico';
        `$copy_favicon`;
    }

    # Downloads
    my $src_dwns = $dir_src . '/' . $dir_dwns;
    if (-d $src_dwns){
        my $cm_dwns = 'cp -r ' . $src_dwns . ' ' . $dir_build . '/dwns';
        `$cm_dwns`;
    }
    

    foreach my $st (@stuffs){
        my ($sty)       =   $st         =~ m/[\/]([^\/]+)$/;
        my $final_st    =   $dir_build . '/data/' . $sty;
        my $cm = 'cp ' . $st . ' '. $final_st;
        `$cm`;
    }

    my $css_header_links = '';
    foreach my $css_src (@css){
        my $wd = read_file($css_src);
        my ($nombre_limpio) = $css_src =~ m/[\/]([^\/]+)$/;
        my $nombre_css_final = $dir_build . '/css/' . $nombre_limpio;
        my $nombre_css_final_l = 'css/' . $nombre_limpio;
        write_file($nombre_css_final,optimize($wd, 1));

        #armar links
        my $link_final_css = '<link rel="stylesheet" type="text/css" href="' . 
                                $nombre_css_final_l . '">';
        $css_header_links .= $link_final_css . "\n";
    }
    
    my @Indexes = ();
    foreach my $page (@pages){
        my $shit = read_file($page);
        my @ii_ = stat($page);
        my $ultima_modificacion = $ii_[9];
        my ($titulo_page,$titulo_index) = make_title($shit);
        my $dinamic_keys = '<meta name="keywords" content="' . get_keywords($titulo_index) . '">'; # keywords from title.
        my $header_with_css = make_header ($css_header_links,$dinamic_keys);
        my $contenido = $header_with_css;
        $contenido .= '<body>' . "\n";
        $contenido .= $div_return_home;
        $contenido .= markdown($shit) . "\n";
        if ($comments_allow){
            my $comments = embed_comments($titulo_page);
            $contenido .= $comments;
        }
        $contenido .= $div_return_home;
        $contenido .= pie();
        my $nombre_archivo_final = $dir_build . '/' . $titulo_page . '.html';
        my $nombre_archivo_final_l = $titulo_page . '.html';
        $linky{$nombre_archivo_final_l} = $ultima_modificacion . 'spliteo' . $titulo_index;
        write_file( $nombre_archivo_final , optimize($contenido , 0));
    }


# I N D E X
    my $indexin = make_header ($css_header_links);
    $indexin .= '<body>';
    $indexin .= index_datas();
    $indexin .= do_index();
    my $indexin_file_nombre = $dir_build . '/index.html';
    write_file( $indexin_file_nombre , optimize($indexin,0) );
    do_htaccess();
}

sub do_SEOand_shut_up{
    my $meta_desc = '<meta name="description" content=' . $blog_desc . '>';
    my $meta_author = '<meta name="author" content=' . $blog_autores . '>';
    my $meta_key = '<meta name="keywords" content=';
    my $string_keywords = '"' . join(', ',@keywords_fixed) . '"' . '>';
    my $final_string_seo = $meta_author . $meta_desc . $meta_key . $string_keywords;
    return $final_string_seo;
}

sub get_keywords {
    # a keyword is anything longer than 4 caracters within the main title.
    my $inputo = $_[0];
    my @words = split(/ /,$inputo);
    my @words_b = map { length ($_) >= 4 ?  $_ : () } uniq(@words);
    my $cdeJu = join (',',@words_b);
    $cdeJu=~ s/:!?//g;
    return $cdeJu;
}

sub do_index {
    my $ind = '<table>';
    # Agregado: Ordenar la table por fecha, desc
    foreach my $n_html_page (reverse(sort { $linky{$a} <=> $linky{$b} } keys %linky)){
        my ($modif,$l) = split(/spliteo/, $linky{$n_html_page});
        my $modifiz = strftime ("%d - %B - %Y ~  %H:%M",localtime( $modif ));
        my $lllll    = '<tr><td>' .
            '<a href="' . $n_html_page . '" >' . $l . 
            '</a>' . '</td><td>' . $modifiz . '</td>' .
            '</tr>';
        $ind        .= $lllll . "\n";
    }
    $ind .= '</table>';
    $ind .= pie();
    return $ind;
}

sub pie{
   my $fin = $pie_html . '</body></html>';
   return $fin;
}

sub make_header {
    my $in = $_[0];
    my $in_2 = $_[1];
    my $fucking_utf = '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>' . "\n";
    my $fucking_seo = do_SEOand_shut_up();
    my $H;
    if ($in_2){
        $H = '<!doctype html><head>' . $fucking_seo . $favico_link_para_header . "\n" . $in . $in_2 . "\n" . $fucking_utf . '</head>';
    } else {
        $H = '<!doctype html><head>' . $fucking_seo . $favico_link_para_header . "\n" . $in . "\n" . $fucking_utf . '</head>';
    }
    return $H;    
}


sub make_title {
    my $o = $_[0];
    my @dd = split ( /\n/, $o );
    my $c = $dd[0];
    $c =~ s/^#//g;
    $c =~ s/ //;
    my $d = $c;
    $c =~ s/ /_/g;
    $c =~ s/á/a/gi;
    $c =~ s/é/e/gi;
    $c =~ s/í/i/gi;
    $c =~ s/ó/o/gi;
    $c =~ s/ú/u/gi;
    $c =~ s/ñ/ñ/gi;
    $c =~ s/!/sep/gi;
    $c =~ s/://gi;
    return ($c, $d);
}




sub get_stuff {
    my $pp = $_[0];
    my $stuff = $_[1];
    my @ff = ();
    if ($stuff eq 'stuff'){
        @ff = File::Find::Rule   -> file ()
                                    -> name ('*.png', '*.jpeg', '*.jpg', '*.gif')
                                    -> in   ($pp);
    } else {
        @ff = File::Find::Rule   -> file ()
                                    -> name ($stuff)
                                    -> in   ($pp);
    }
    return @ff;
}


sub index_datas {
    my $md = '';
    while (<DATA>){
        $md .= $_;
    }
    my $coso = markdown($md);
    $coso =~ s#<h1>#<header><h1>#;
    $coso =~ s#</h2>#</h2></header>#;
    return $coso;
}

sub optimize {
    my $inputy = $_[0];
    my $espacios = $_[1];
    unless($inputy =~ m/<code>/g){
        $inputy =~ s/\n+|\t+//g;
        if ($espacios) {
            $inputy =~ s/\s+//g;
        }
    }
    return $inputy;
}


sub embed_comments {
    my $id_disqus = shift;
    my $disqus_page_url         = '"https://3456.com.ar"' ;
    my $disqus_identifier       = q|'"| . $id_disqus . q|"'| ;
    my $disqus_forum_shortname  = 3456;

    my $comments = '
<div id="disqus_thread"></div><script>
    var disqus_config = function () {
        this.page.url = PAGE_URL;
        this.page.identifier = PAGE_IDENTIFIER;
    };
    (function() { 
        var d = document, s = d.createElement("script");
        s.src = "https://EXAMPLE.disqus.com/embed.js"; 
        s.setAttribute("data-timestamp", +new Date());
        (d.head || d.body).appendChild(s);
    })();
</script>
<noscript>JavaScript es necesario para ver los <a href="https://disqus.com/?ref_noscript" rel="nofollow">comentarios.</a></noscript>
';


    $comments =~ s/PAGE_URL/$disqus_page_url/;             #// Replace PAGE_URL with your page's canonical URL variable
    $comments =~ s/PAGE_IDENTIFIER/$disqus_identifier/;    #// Replace PAGE_IDENTIFIER with your page's unique identifier variable
    $comments =~ s/EXAMPLE/$disqus_forum_shortname/;       #// IMPORTANT: Replace EXAMPLE with your forum shortname!
    return $comments;
}

sub do_htaccess {
    my $ht_nn = $dir_build . '/.htaccess' ;
    write_file($ht_nn,$htaccess);
    chmod 0755, $ht_nn;
}

######################################################################
#                                                       P O D  Z O N E
######################################################################
=pod

=head1 Autor y Licencia.

Programado por B<Marxbro> aka B<Gstv>, ditribuir solo bajo la licencia
WTFPL: I<Do What the Fuck You Want To Public License>.

Zaijian.

=cut

__DATA__

# 3456

## Este un blog personal... o algo así.

Me acostumbré a firmar como __MarxBro__ y eso no creo que cambie en un futuro cercano.

Acá escribo lo que me va pareciendo relevante o simplemente, lo que tengo ganas de escribir. 
No es gran cosa y responde casi exclusivamente a mis caprichos informáticos (sobre Perl, Linux y lo que vaya apareciendo).

Mi perfil en github y mis repositorios están [a su disposición](https://github.com/MarxBro).

Dejen un comentario si tienen algo que decirme, corregirme, putearme, etc.

La página se llama así porque __re-pintó__ y está hecha en bas a un CMS que hice por ahí.

Abajo hay una lista de las cosas que voy escribiendo y reescribiendo.

## Entradas:
