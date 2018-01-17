package Sah::Schema::net::hostname;

# DATE
# VERSION

our $schema = [str => {
    summary => 'Hostname',
    match => '^(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])$', # as per RFC 1123
}, {}];

1;
# ABSTRACT: Hostname

=head1 DESCRIPTION

Hostname is checked using a regex as per RFC 1123.

Ref: L<https://stackoverflow.com/questions/106179/regular-expression-to-match-dns-hostname-or-ip-address>
