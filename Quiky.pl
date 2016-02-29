#!/usr/bin/perl
######################################################################
# Blog en una hora: hoy voy a hacer un blog estático en dos horas.
# A ver que carajo sale de esto...
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
use File::Copy              qw/copy/;

=pod

=encoding utf8

=head1 SYNOPSIS

Script para bloggear como un enfermo.

=cut

my $t_banana = strftime ("%d_%B_%Y_%H_%M_%S",localtime(time()));

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
my $dir_build   = "build" . "__" . $t_banana;
unless (-d $dir_build){
    mkdir $dir_build;
}
my $dir_src     = "./src";
my %linky       = ();

######################################################################
#                                                               Main
######################################################################
if ($opts{h}){
    ayudas();
    exit 0;
} else {
    if ($opts{b}){
        build();
    } else {
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

    my $css_header_links = '';
    foreach my $css_src (@css){
        my $nombre_css_final = $dir_build . '/' . $css_src;
        #copiarlo al build dir
        copy $css_src, $nombre_css_final;
        #armar links
        my $link_final_css = '<link rel="stylesheet" type="text/css" href="' . $nombre_css_final . '">';
        $css_header_links .= $link_final_css . "\n";
    }
    my $header_with_css = make_header ($css_header_links);
    
    my @Indexes = ();
    foreach my $page (@pages){
        my $shit = read_file($page);
        my $contenido = $header_with_css;
        $contenido .= '<body>' . "\n";
        $contenido .= markdown($shit) . "\n";
        $contenido .= '</body></html>';
        my ($titulo_page,$titulo_index) = make_title($shit);
        my $nombre_archivo_final = $dir_build . '/' . $titulo_page . '.html';
        $linky{$nombre_archivo_final} = $titulo_index;
        write_file( $nombre_archivo_final , $contenido );
    }

# I N D E X
    my $indexin = $header_with_css;
    $indexin .= index_datas();
    $indexin .= do_index();
    my $indexin_file_nombre = $dir_build . '/index.html';
    write_file( $indexin_file_nombre , $indexin );
}

sub do_index {
    my $ind = '<body>';
    foreach my $n_html_page (sort(keys(%linky))){
        my $lllll    = '<a href="' . './' . $n_html_page . '" target="_blank">' . $linky{$n_html_page} . '</a>';  
        $ind        .= $lllll . "\n";
    }
    $ind .= '</body></html>';
    return $ind;
}



sub make_header {
    my $in = $_[0];
    my $fucking_utf = '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>' . "\n";
    my $H = '<!doctype html><head>' . $in . "\n" . $fucking_utf . '</head>';
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
    my @ff = File::Find::Rule   -> file ()
                                -> name ($stuff)
                                -> in   ($pp);
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
