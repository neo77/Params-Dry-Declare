use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Params::Declare',
    AUTHOR           => q{Pawel Guspiel (neo77) <neo@cpan.org>},
    VERSION_FROM     => 'lib/Params/Declare.pm',
    ABSTRACT_FROM    => 'lib/Params/Declare.pm',
    LICENSE          => 'Artistic_2_0',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::Most' => 0,
    },
    PREREQ_PM => {
        'Params' => 0,
        'Exporter' => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Params-Declare-*' },
);


