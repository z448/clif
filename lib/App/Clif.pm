package App::Clif;

use 5.006;
use strict;
use warnings;
use JSON::Tiny qw( decode_json encode_json );
use Term::ANSIColor;

BEGIN {
    require Exporter;
    our $VERSION = 0.01;
    our @ISA = qw(Exporter);
    our @EXPORT = qw( clif );
}



my $cli = sub {
        my $this = shift;
        my( $curl, @cmd )= ();
    while( <DATA> ){
        open( my $o, "-|", "curl -s $_");
        while( <$o> ){ $curl = $_ }
        open( my $oO, "-|", q'curl -sL ' . $curl . q'.com/commands/using/'."$this".q'/json' );
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
    my( $get, $cut ) = @_;
    if ($cut){
        $cut = qr/$cut/;
    } else { $cut = qr/./ }

    my @cut = grep{ $_->{$get} =~ m/$cut/ } @{$cli->( $get )};
    return \@cut;
}
clif(@ARGV);
#source
__DATA__
https://gist.githubusercontent.com/z448/3dcb01b979a3b31b7716/raw/17de137a16f80d41c6ff13654550f38504cdd8ce/
