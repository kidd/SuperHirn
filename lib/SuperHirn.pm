package SuperHirn;
use Moose;
use feature ':5.10';
use List::MoreUtils qw/all/;
use Moose::Autobox;
use autobox::Core;
use autobox;

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

has 'tablero' => (is =>'rw', 
				isa =>'ArrayRef[SuperHirn::Jugada]',
				predicate => 'has_tablero',
				default => sub { [] } ,
			);
has 'solution' => (is =>'rw', isa =>'SuperHirn::Jugada');
has 'puntuacio' => (is =>'rw', isa =>'ArrayRef[Str]');

has 'player1' => (
	is =>'rw',
	isa =>'SuperHirn::Player::Guesser' ,
	required => '1');

has 'player2' => (
	is =>'rw',
	isa =>'SuperHirn::Player::Master' ,
	required => '1');

has 'size' => (is =>'rw', isa =>'Int', default => 5);
#has 'puntuacio' => (is =>'rw', isa =>'ArrayRef[HighScore]');

=head1 FUNCTIONS

=head2 init

=over 4

=item Arguments:

=back

=cut
sub init {
	my ($self) = @_;
	$self->solution($self->player2->createComb);
}

=head2 run

=cut

use Data::Dumper;
sub run {
	my ($self) = @_;
	print "Hi, today the challengers for mastermind are:",
	$self->player1->name, " vs " , $self->player2->name, "\n";
	$self->init;
	my $count=0;
	print Dumper $self->solution;

	until ($self->finished) {
		my $next = $self->player1->guessNext($self->tablero);
		$self->tablero->push($next);# default value
		++$count;
		#say $next->dump;
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
	return 0 unless ( $self->tablero->length);
	return $self->player2->comprova($self->tablero->[-1]);
}


no Moose;
__PACKAGE__->meta->make_immutable;

=head1 AUTHOR#{{{

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

1; # End of SuperHirn#}}}
