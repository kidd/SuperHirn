#!perl -T

use strict;
use warnings;

use Test::More;
use Test::Moose;
use Test::Exception;
use SuperHirn::Player::Guesser;
use SuperHirn::Player::Master;
use SuperHirn::Jugada;
use SuperHirn;

my $pl;
lives_ok { $pl =  SuperHirn::Player->new(name => "ray") } "ray player created";

is($pl->name, "ray", "ray still haz name");
my $ray = SuperHirn::Player::Guesser->new(name => "ray"), 
my $g;
$g = SuperHirn->new(
	player1 => $ray,
	player2 =>  SuperHirn::Player::Master->new(name => "hele"), );

isa_ok($g->player1->guessNext , 'SuperHirn::Jugada');

my $master = SuperHirn::Player::Master->new(name=>'tester');
$master->createComb;
ok ($master->comprova(SuperHirn::Jugada->new(
		playerPlay=>['red','yellow','black','white','beige'])));

is($master->comprova( SuperHirn::Jugada->new(
		playerPlay=>['yellow','yellow','black','white','beige'])), '', "wrong combination");

is ($master->diff(SuperHirn::Jugada->new(
		playerPlay=>['red','yellow','black','white','beige'])),(5,0),"all blacks ok" );

is ($master->diff(SuperHirn::Jugada->new(
		playerPlay=>['black','red','black','white','beige'])),(3,1),"3 black 1 white" );
#$ray->comprova($g);
done_testing;

