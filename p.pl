#!/usr/bin/perl
use strict;

my $t = '<p>parrafo</p>
asljdn<h1>
asljdn</h1>
asldn';

$t =~ m/\Q<p>\E([^<]+)\Q<\/p>\E/;
print  $1;
