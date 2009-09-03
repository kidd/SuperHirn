package SuperHirn::Ficha; 
use Moose;
use Moose::Util::TypeConstraints;

=head1 NAME

Fitxa - The great new Fitxa!

=head1 VERSION

Version 0.01

=cut

#subtype 'SuperHirn::Ficha::Color'  
#=> as 'Str',
#=> where { /jjjj/ },  
#=> message { "This color does not exist" };

enum 'Color' => qw/red green beige black white yellow/ ;

has 'color' => (is =>'rw', isa =>'Color');

__PACKAGE__->meta->make_immutable;
no Moose;
1;
__END__

