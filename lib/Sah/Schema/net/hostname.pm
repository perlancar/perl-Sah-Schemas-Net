package Sah::Schema::net::hostname;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'Hostname',
    match => '\\A(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])\\z', # as per RFC 1123

    examples => [
        {value=>'', valid=>0},
        {value=>'example', valid=>1},
        {value=>'example.com', valid=>1},
        {value=>'www.example.com', valid=>1},
        {value=>'12.34.56.78', valid=>1},
        #{value=>'12.34.56.789', valid=>0}, # should invalid ipv4 be allowed?
        {value=>'www_new.example.com', valid=>0, summary=>'Underscore not allowed'},
        {value=>'www.example-two.com', valid=>1},
        {value=>'www.example--two.com', valid=>1},
        {value=>'www.example-.com', valid=>0, summary=>'Word ending in dash not allowed'},
        {value=>'www.-example.com', valid=>0, summary=>'Word starting in dash not allowed'},
        {value=>'www.-example.com', valid=>0, summary=>'Word starting in dash not allowed'},
    ],

}, {}];

1;
# ABSTRACT: Hostname

=head1 DESCRIPTION

Hostname is checked using a regex as per RFC 1123.

Ref: L<https://stackoverflow.com/questions/106179/regular-expression-to-match-dns-hostname-or-ip-address>
