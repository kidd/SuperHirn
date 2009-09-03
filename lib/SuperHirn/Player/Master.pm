package SuperHirn::Player::Master;
=head1 NAME

Player::Master - The great new Player!

=head1 VERSION

Version 0.01

=cut
use Moose;
extends 'SuperHirn::Player';


=head2 createComb

=over 4

=item Arguments:

=back

=cut
sub createComb {
	my ($self) = @_;
	my @options= qw/red green beige black white yellow/ ;
	return [map ( $options[int rand @options]  , 1..@options)];
}



=head2 comprova

Donat una una jugada, comprova retorna les pius negres i blancs

=over 4

=item Arguments:

=back

=cut
sub comprova {
	my ($self, $game) = @_;
	print length $game->tablero;
}

__PACKAGE__->meta->make_immutable;
no Moose;1;
