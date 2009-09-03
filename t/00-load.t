#!perl -T

use Test::More ;

BEGIN {
	use_ok( 'SuperHirn' );
	use_ok( 'SuperHirn::Ficha' );
	use_ok( 'SuperHirn::Player' );
	use_ok( 'SuperHirn::Jugada' );
}

diag( "Testing SuperHirn $SuperHirn::VERSION, Perl $], $^X" );

done_testing;
