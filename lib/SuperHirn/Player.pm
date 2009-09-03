package SuperHirn::Player;
=head1 NAME

Player - The great new Player!

=head1 VERSION

Version 0.01

=cut
use Moose;

has 'name' => (is =>'rw', isa =>'Str' , required => '1');
has 'HighScores' => (is =>'rw', isa =>'ArrayRef[Int]');


__PACKAGE__->meta->make_immutable;
no Moose;1;
