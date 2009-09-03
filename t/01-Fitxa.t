#!perl -T

use strict;
use warnings;

use Test::More;
use Test::Moose;
use Test::Exception;
use SuperHirn::Ficha;

my $ficha =SuperHirn::Ficha->new( color => 'red');

dies_ok {
	SuperHirn::Ficha->new( color => 'Red');
} "Red is not a lowercase color";

is ($ficha->color, "red", "red is red in string");

done_testing;
