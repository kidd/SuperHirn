package SuperHirn::Player::Master;
=head1 NAME

Player::Master - The great new Player!

=head1 VERSION

Version 0.01

=cut
use Moose;
use Moose::Autobox;
use autobox::Core;
use autobox;
use Array::Compare;
use List::Util qw(min);
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

=head2 diff
Takes a 1 jugada and returns the diferences between it an the winnerComb in a hash like
{ black => blackPins, white => whitePins }
=over 4
=item Arguments: 
	SuperHirn::Jugada
=cut

sub diff {
	my ($self, $jugada) = @_;
	#print $_ for (qw/red green beige black white yellow/);
	my $blacks = $self->black($jugada->playerPlay, $self->winnerComb->playerPlay);
	my $whites = $self->white($jugada->playerPlay,
		$self->winnerComb->playerPlay,[qw/red green beige black white yellow/] 
		);
		return ($blacks, $whites-$blacks);
}

sub white {
	my ($self, $guess, $winner, $colours_ref) = @_;
	my $acc=0;
	foreach my $color (@$colours_ref) {
		$acc += min( scalar grep( $_ eq $color ,@$guess ) , 
					scalar grep( $_ eq $color ,@$winner ) );
	}
	return $acc;
}

sub black {
	my ($self , $guess, $winner) =@_;
	my $blacks = 0;
	foreach my $pos (0..$winner->length-1) {
		$blacks++ if ($winner->[$pos] eq 
						$guess->[$pos]);
	}
	return $blacks;
}

__PACKAGE__->meta->make_immutable;
no Moose;1;
