package SuperHirn::Jugada;
use Moose;

=head1 NAME

SuperHirn::Jugada - The great new SuperHirn!

=head1 VERSION

Version 0.01

=cut

use Moose;
use Moose::Util::TypeConstraints;

enum 'Color' => qw/red green beige black white yellow/ ;

#has 'playerPlay' => (is =>'rw', isa =>'ArrayRef[Str]' ); # pq no puede ser [Color] ?

has 'col' => (is =>'rw', isa =>'Color');
has 'playerPlay' => (is =>'rw', isa =>'ArrayRef[Color]');
has 'check' => (is =>'rw', isa =>'ArrayRef[Int]');

=head2 asString

=over 4

=item Arguments:

=back

=cut
sub asString {
	my ($self) = @_;
	my $res;
	my @arr = map { $_->color } @$self->playerPlay;
	#my @arr2 = map { $_ } @$self->check;
}

__PACKAGE__->meta->make_immutable;
use Moose::Util::TypeConstraints;
no Moose;
1;
