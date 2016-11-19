package App::Clif;

use 5.006;
use strict;
use warnings;
use JSON::PP;
use open qw<:encoding(UTF-8)>;

BEGIN {
    require Exporter;
    our $VERSION = 0.01;
    our @ISA = qw(Exporter);
    our @EXPORT_OK = qw( clif );
}


my $cli = sub {
        my $this = shift;
        my( $curl, @cmd )= ();

        while( <DATA> ){
            open( my $o, "-|", "curl -sk $_");
                while( <$o> ){ $curl = $_ }
                open( my $oO, "-|", q|curl -skL | . $curl . $this . q|/json| );
                my $j = <$oO>;
                my $p = decode_json $j;

                for my $p( @$p ){
                    my %cmd;
                    $cmd{$this} = $p;
                    push @cmd, { %cmd };
                }; return \@cmd;
        }
};


sub clif {
    my( $get )= @_;
        my $cut = qr/./;

    my @cut = grep{ $_->{$get} =~ m/$cut/ } @{$cli->( $get )};
    return \@cut;
}

#source
__DATA__
https://gist.githubusercontent.com/z448/779015ddc421f9f61c6a/raw/5681145b46f6c4510c640c8969430f12bc779435/
