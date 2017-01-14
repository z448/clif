
use 5.010;
use warnings;
use strict;

use HTTP::Tiny;

my $url = 'http://www.commandlinefu.com/commands/browse/';
my $next = 25;

while( 1 ){
    my $url = $url . $next;
    #say "HTTP::Tiny->new->get($url)";
    my $cli = HTTP::Tiny->new->get($url);
    say $cli->{content};
    $next += 25;
    sleep 1;
}

