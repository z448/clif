use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'App::Clif',
    ABSTRACT         => 'CLI tool to search web sources for cli commands.',
    AUTHOR           => q{z448 <zed448@icloud.com>},
    VERSION          => '0.01',
    DISTNAME         => 'App-clif',
    EXE_FILES        => [
                        'bin/clif'
                    ],
    LICENSE          => 'perl',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        'JSON::PP'        => 0.1,
        #'ABC'              => 1.6,
        #'Foo::Bar::Module' => 5.0401,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'App-Clif-*' },
);
