package Sah::Schema::net::ipv4;

# DATE
# VERSION

our $schema = [obj => {
    summary => 'IPv4 address',
    isa => 'NetAddr::IP',
    'x.perl.coerce_rules' => [
        'From_str::net_ipv4',
    ],
}, {}];

1;
# ABSTRACT: IPv4 address

=head1 DESCRIPTION

Currently using L<NetAddr::IP> object.
