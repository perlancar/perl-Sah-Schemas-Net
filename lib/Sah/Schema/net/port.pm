package Sah::Schema::net::port;

# DATE
# VERSION

our $schema = [int => {
    summary => 'Network port number',
    between => [1, 65535],
}, {}];

1;
# ABSTRACT:

=head1 DESCRIPTION
