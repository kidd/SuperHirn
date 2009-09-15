package SuperHirn::Player::Guesser;
=head1 NAME

Player::Guesser - The great new Player!

=head1 VERSION

Version 0.01

=cut
use Moose;
use SuperHirn::Jugada;
extends 'SuperHirn::Player';

has 'cache' => (is =>'rw',
	isa =>'HashRef[Int]', 
	default => sub {return {}; }
				);


=head2 guessNext

Ara nomes torna una jugada aleatoria, sense memoria

=over 4

=item Arguments:

=back

=cut
sub guessNext {
	my ($self, $tablero) = @_;
		my @ref =qw/red green beige black white yellow/ ;
		my $nextPlay = [map {@ref[int rand @ref]} 1..5];
		$nextPlay = [map {@ref[int rand @ref]} 1..5] while ( exists $self->cache->{join '', @$nextPlay} );
		my $a = SuperHirn::Jugada->new( 
		#playerPlay => [map {@ref[int rand @ref]} 1..5] );
		playerPlay => $nextPlay);
	#playerPlay => ['red', 'yellow', 'black' , 'white' , 'beige'] );
	$self->cache->{join '', @$nextPlay} = 1;
		return $a;
}

__PACKAGE__->meta->make_immutable;
no Moose;1;
