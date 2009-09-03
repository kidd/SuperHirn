package SuperHirn;
use Moose;
use feature ':5.10';
use List::MoreUtils;

=head1 NAME

SuperHirn - The great new SuperHirn!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use SuperHirn;

    my $foo = SuperHirn->new();
    ...

=cut

has 'tablero' => (is =>'rw', isa =>'ArrayRef[SuperHirn::Jugada]');
has 'solution' => (is =>'rw', isa =>'ArrayRef[Str]');
has 'puntuacio' => (is =>'rw', isa =>'ArrayRef[Str]');

has 'player1' => (
	is =>'rw',
	isa =>'SuperHirn::Player::Guesser' ,
	required => '1');

has 'player2' => (
	is =>'rw',
	isa =>'SuperHirn::Player::Master' ,
	required => '1');

#has 'puntuacio' => (is =>'rw', isa =>'ArrayRef[HighScore]');

=head1 FUNCTIONS

=head2 run

=cut

use Data::Dumper;
sub run {
	my ($self) = @_;
	print "Hi, today the challengers for mastermind are:",
	$self->player1->name, " vs " , $self->player2->name, "\n";
	my $count=0;
	$self->solution($self->player2->createComb);
	print Dumper $self->solution;

	while (!$self->finished) {
		my $next = $self->player1->guessNext($self);
		$self->tablero->push->($next); #moose autobox
		$self->finished( $self->player2->comprova($self) );
	}
	say "player1 won after $count tries";
}

=head2 finished

=over 4

=item Arguments:

=back

=cut
sub finished {
	my ($self) = @_;
	#return  pairwise {$a eq $b } $self->solution , $self->tablero->[-1] ||
	return  pairwise {$a eq $b } $self->solution , ('red');
}


no Moose;
__PACKAGE__->meta->make_immutable;

=head1 AUTHOR

Raimon Grau, C<< <raimonster at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-superhirn at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=SuperHirn>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc SuperHirn


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=SuperHirn>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/SuperHirn>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/SuperHirn>

=item * Search CPAN

L<http://search.cpan.org/dist/SuperHirn/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2009 Raimon Grau, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of SuperHirn
