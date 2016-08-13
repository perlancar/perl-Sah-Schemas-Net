package Data::Sah::Coerce::perl::obj::str_net_ipv4;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

sub meta {
    +{
        v => 2,
        enable_by_default => 0,
        might_die => 1,
        prio => 50,
    };
}

sub coerce {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{modules}{'NetAddr::IP'} //= 0;
    $res->{expr_match} = "!ref($dt)";
    $res->{expr_coerce} = join(
        "",
        "do { my \$ip = NetAddr::IP->new($dt) or die 'Invalid IP address syntax';",
        " \$ip->bits == 32 or die 'Not an IPv4 address (probably IPv6)';",
        " \$ip->masklen == 32 or die 'Not a single IPv4 address (an IP range)';",
        " \$ip }",
    );

    $res;
}

1;
# ABSTRACT: Coerce IPv4 address object from string

=for Pod::Coverage ^(meta|coerce)$

=head1 DESCRIPTION
