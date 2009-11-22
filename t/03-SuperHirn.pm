#!perl -T

use strict;
use warnings;

use Perl6::Say;
use Test::More;
use Test::Moose;
use Test::Exception;
use SuperHirn;
use SuperHirn::Player::Guesser;
use SuperHirn::Jugada;
use SuperHirn::Player::Master;
use autobox::Core;


dies_ok {
	SuperHirn->new();
} "must be initialized with 2 players";

my $g;
lives_ok {
	$g = SuperHirn->new(
	player1 =>  SuperHirn::Player::Guesser->new(name => "ray"), 
	player2 =>  SuperHirn::Player::Master->new(name => "hele"), 
	size => 5,
	);
} "must be initialized with 2 players";

$g->init;
	isnt($g->finished(),1,"empty tablero");

for (1..4) {
	$g->tablero->push(SuperHirn::Jugada->new(
			playerPlay=>['black','yellow','black','white','beige']));

	isnt($g->finished(),1,"empty tablero");
}
$g->tablero->push(SuperHirn::Jugada->new(
		playerPlay=>['red','yellow','black','white','beige']));

is($g->finished,1, "jugadas are equal, we finished");

done_testing;
