package Data::Sah::Coerce::perl::To_obj::From_str::net_ipv4;

# AUTHOR
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

sub meta {
    +{
        v => 4,
        summary => 'Coerce IPv4 address object from string',
        might_fail => 1,
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
        "do { my \$ip = NetAddr::IP->new($dt); if (!\$ip) { ['Invalid IP address syntax'] } ",
        "elsif (\$ip->bits != 32) { ['Not an IPv4 address (probably IPv6)'] } ",
        "elsif (\$ip->masklen != 32) { ['Not a single IPv4 address (an IP range)'] } ",
        "else { [undef, \$ip] } ",
        "}",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|coerce)$
