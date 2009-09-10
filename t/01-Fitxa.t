#!perl -T

use strict;
use warnings;

use Test::More;
use Test::Moose;
use Test::Exception;
use SuperHirn::Ficha;
use SuperHirn::Jugada;
#use SuperHirn::Jugada::Color;

print SuperHirn::Jugada->meta->dump;
#print Color->dump;

my $ficha =SuperHirn::Ficha->new( color => 'red');

my @ref = qw/red green beige black white yellow/;

for (uc @ref) {
	dies_ok {
		SuperHirn::Ficha->new( color => $_);
	} "$_ is not a lowercase color";
	print $_,"\n";
}

for (@ref) {
	lives_ok {
		SuperHirn::Ficha->new( color =>$_);
	} "$_ is ok";
}

is ($ficha->color, "red", "red is red in string");

done_testing;
