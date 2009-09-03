package SuperHirn::Player::Guesser;
=head1 NAME

Player::Guesser - The great new Player!

=head1 VERSION

Version 0.01

=cut
use Moose;
extends 'SuperHirn::Player';

=head2 guessNext

Ara nomes torna la mateixa jugada

=over 4

=item Arguments:

=back

=cut
sub guessNext {
	my ($self, $tablero) = @_;
	if ($tablero->[-1]) {
		return $tablero->[-1];
	}
	return SuperHirn::Jugada->new(
		playerPlay => ['red', 'yellow', 'black' , 'white' , 'beige'] )
		#playerPlay => [qw/red yellow blue beige black/]);
}

__PACKAGE__->meta->make_immutable;
no Moose;1;
