#!perl -T

use strict;
use warnings;

use Test::More;
use Test::Moose;
use Test::Exception;
use SuperHirn::Jugada;
use SuperHirn;

my $pl;

$pl =  SuperHirn::Jugada->new;
lives_ok{$pl->col('red')} "si";

lives_ok {$pl->playerPlay( ['red', 'black'] )} "siiii";
done_testing;

exit;
lives_ok { $pl =  SuperHirn::Jugada->new(playerPlay => ['red', 'blue']) } "jugada ok";

is($pl->name, "ray", "ray still haz name");
my $ray = SuperHirn::Player::Guesser->new(name => "ray"), 
my $g;
$g = SuperHirn->new(
	player1 => $ray,
	player2 =>  SuperHirn::Player::Master->new(name => "hele"), );

isa_ok($g->player1->guessNext , 'SuperHirn::Jugada');

#$ray->comprova($g);

done_testing;
