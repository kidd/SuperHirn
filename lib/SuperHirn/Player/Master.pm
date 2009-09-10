package SuperHirn::Player::Master;
=head1 NAME

Player::Master - The great new Player!

=head1 VERSION

Version 0.01

=cut
use Moose;
use Array::Compare;
extends 'SuperHirn::Player';

has 'winnerComb' => (is =>'rw', isa =>'SuperHirn::Jugada');

=head2 createComb

=over 4

=item Arguments:

=back

=cut
sub createComb {
	my ($self) = @_;
	my @options= qw/red green beige black white yellow/ ;
	#return [map ( $options[int rand @options]  , 1..@options)];
	$self->winnerComb( SuperHirn::Jugada->new(
		playerPlay=> ['red', 'yellow', 'black' , 'white' , 'beige']));
		return $self->winnerComb;
}



=head2 comprova

Donat una una jugada, comprova retorna les pius negres i blancs

=over 4

=item Arguments:  Jugada a comparar

=back

=cut
sub comprova {
	my ($self, $jugada) = @_;
	my @res = (0,0); #black , white
	print $jugada->dump;
	my $comp1 = Array::Compare->new;

	return $comp1->compare(
		$jugada->playerPlay,
		$self->winnerComb->playerPlay);
}

__PACKAGE__->meta->make_immutable;
no Moose;1;
