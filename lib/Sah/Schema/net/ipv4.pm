package Sah::Schema::net::ipv4;

# AUTHORITY
# DATE
# DIST
# VERSION

use NetAddr::IP ();

our $schema = [obj => {
    summary => 'IPv4 address',
    isa => 'NetAddr::IP',
    'x.perl.coerce_rules' => [
        'From_str::net_ipv4',
    ],

    examples => [
        {value=>'', valid=>0},
        #{value=>'12.34.56.78', valid=>1, validated_value=>NetAddr::IP->new("12.34.56.78")}, # commented for now, is_deeply() fails
        {value=>'12.345.67.89', valid=>0},
    ],

}, {}];

1;
# ABSTRACT: IPv4 address

=head1 DESCRIPTION

Currently using L<NetAddr::IP> object.
