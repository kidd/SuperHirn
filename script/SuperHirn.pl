#!/usr/bin/perl
use strict;
use warnings;
use SuperHirn::Player::Guesser;
use SuperHirn::Player::Master;
use SuperHirn;
use SuperHirn::Jugada;
use Data::Dumper;

my $pl =  SuperHirn::Jugada->new;
#$pl->playerPlay([$SuperHirn::Jugada::Color::red, $SuperHirn::Jugada::Color::blue]);
print $pl->dump, "\n";
my ( $a , $b ) = (
	SuperHirn::Player::Guesser->new(name => "Ray") ,
	SuperHirn::Player::Master->new( name=>"Helena"));

my $game = SuperHirn->new( player1 => $a, player2 => $b );
print $game->dump;
$game->run;

