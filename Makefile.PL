use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;
use File::ShareDir::Install;

install_share dist => 'share';

WriteMakefile(
    NAME               => 'Food::ECodes',
    AUTHOR             => q{Mohammad S Anwar <mohammad.anwar@yahoo.com>},
    VERSION_FROM       => 'lib/Food/ECodes.pm',
    ABSTRACT_FROM      => 'lib/Food/ECodes.pm',
    LICENSE            => 'artistic_2',
    PL_FILES           => {},
    MIN_PERL_VERSION   => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker'     => 0,
        'File::ShareDir::Install' => 0,
    },
    BUILD_REQUIRES   => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        'Moo' => 0,
        'namespace::clean' => 0,
        'XML::Simple'      => '2.20',
        'File::Share'      => '0.25',
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Food-ECodes-*' },
    (eval { ExtUtils::MakeMaker->VERSION(6.46) } ? (META_MERGE => {
        'meta-spec' => { version => 2 },
        resources => {
            repository => {
                type => 'git',
                url  => 'https://github.com/Manwar/Food-ECodes.git',
                web  => 'https://github.com/Manwar/Food-ECodes',
            },
        }})
     : ()
    ),
);


package MY;
use File::ShareDir::Install 'postamble';
