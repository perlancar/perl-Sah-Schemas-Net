package Sah::Schema::net::port;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [int => {
    summary => 'Network port number',
    between => [1, 65535],

    # XXX coerce from service names e.g. smtp

    examples => [
        {value=>'', valid=>0},
        {value=>1, valid=>1},
        {value=>80, valid=>1},
        {value=>65535, valid=>1},
        {value=>65536, valid=>0},
    ],

}, {}];

1;
# ABSTRACT:

=head1 DESCRIPTION
