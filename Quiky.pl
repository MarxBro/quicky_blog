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
                    $t_manzan . ' by <strong>MarxBro</strong>.' . '</span>';

#Favicon: Previene el error 404
my $favico_link_para_header = '<link rel="shortcut icon" href="favicon.ico"/>';

my $exitos = "Todo anduvo joya; en la carpeta " . $dir_build . " esta el blog.";

# C O M E N T A R I O S -> disqus.
my $comments = '
<div id="disqus_thread"></div><script>
    var disqus_config = function () {
        this.page.url = PAGE_URL;
        this.page.identifier = PAGE_IDENTIFIER;
    };
    (function() { 
        var d = document, s = d.createElement('script');
        s.src = 'https://EXAMPLE.disqus.com/embed.js'; 
        s.setAttribute('data-timestamp', +new Date());
        (d.head || d.body).appendChild(s);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript" rel="nofollow">comments powered by Disqus.</a></noscript>
';

my $disqus_page_url         = 'https://3456.com.ar' ;
my $disqus_identifier       = '3456';
my $disqus_forum_shortname  = '3456';

$comments =~ s/PAGE_URL/$disqus_page_url/;             #// Replace PAGE_URL with your page's canonical URL variable
$comments =~ s/PAGE_IDENTIFIER/$disqus_identifier/;    #// Replace PAGE_IDENTIFIER with your page's unique identifier variable
$comments =~ s/EXAMPLE/$disqus_forum_shortname/;       #// IMPORTANT: Replace EXAMPLE with your forum shortname!



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
    my $header_with_css = make_header ($css_header_links);
    
    my @Indexes = ();
    foreach my $page (@pages){
        my $shit = read_file($page);
        my @ii_ = stat($page);
        my $ultima_modificacion = $ii_[9];
        my $contenido = $header_with_css;
        $contenido .= '<body>' . "\n";
        $contenido .= markdown($shit) . "\n";
        $contenido .= '<div><a href="index.html">Volver</a></div>';
        $contenido .= pie();
        my ($titulo_page,$titulo_index) = make_title($shit);
        my $nombre_archivo_final = $dir_build . '/' . $titulo_page . '.html';
        my $nombre_archivo_final_l = $titulo_page . '.html';
        $linky{$nombre_archivo_final_l} = $titulo_index . 'spliteo' . $ultima_modificacion;
        write_file( $nombre_archivo_final , optimize($contenido , 0));
    }

# I N D E X
    my $indexin = $header_with_css;
    $indexin .= '<body>';
    $indexin .= index_datas();
    $indexin .= do_index();
    my $indexin_file_nombre = $dir_build . '/index.html';
    write_file( $indexin_file_nombre , $indexin );
}

sub do_index {
    my $ind = '<table>';
    foreach my $n_html_page (sort(keys(%linky))){
        my ($l,$modif) = split(/spliteo/, $linky{$n_html_page});
        my $modifiz = strftime ("%d-%B-%Y %H:%M",localtime( $modif ));
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
    my $fucking_utf = '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>' . "\n";
    my $H = '<!doctype html><head>' . $favico_link_para_header . "\n" . $in . "\n" . $fucking_utf . '</head>';
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
    return $coso;
}

sub optimize {
    my $inputy = $_[0];
    my $espacios = $_[1];
    $inputy =~ s/\n+|\t+//g;
    if ($espacios) {
        $inputy =~ s/\s+//g;
    }
    return $inputy;
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

# Bloggy

Hola esta es una prueba.

Por el momento estaría, en poco tiempo lo saqué andando.

Faltan las imagenes y majorar el layout (aunque iría con el css, creo).

No tiene ningún soporte para js todavía... una cagada, sep, pero anda.

Abajo hay una lista de entradas.

## Entradas:
