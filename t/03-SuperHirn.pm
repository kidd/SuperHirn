#!perl -T

use strict;
use warnings;

use Test::More;
use Test::Moose;
use Test::Exception;
use SuperHirn;
use SuperHirn::Player::Guesser;
use SuperHirn::Player::Master;


dies_ok {
	SuperHirn->new();
} "must be initialized with 2 players";

my $g;
lives_ok {
	$g = SuperHirn->new(
	player1 =>  SuperHirn::Player::Guesser->new(name => "ray"), 
	player2 =>  SuperHirn::Player::Master->new(name => "hele"), 
	);
} "must be initialized with 2 players";

$g->run;

done_testing;
