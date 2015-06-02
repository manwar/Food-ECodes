#!perl

use Test::More tests => 1;
BEGIN { use_ok( 'Food::ECodes' ) || print "Bail out!"; }

diag( "Testing Food::ECodes $Food::ECodes::VERSION, Perl $], $^X" );
