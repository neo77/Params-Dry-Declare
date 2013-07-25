#!/usr/bin/env perl
#*
#* Name: Params.pm.t
#* Info: Test for Params.pm.t
#* Author: Pawel Guspiel (neo77) <neo@cpan.org>
#*

use strict;
use warnings;

use Test::Most;                      # last test to print

use lib "lib";


package ParamsTest;

use Params::Dry::Declare;
use Params::Dry qw(:short);

typedef 'name', 'String[20]';

sub new (
            ! name:;                                    --- name of the user 
            ? second_name   : name      = 'unknown';    --- second name
            ? details       : String    = 'yakusa';     --- details
        ) {

return bless { 
                name        => $p_name,
                second_name => $p_second_name,
                details     => $p_details, 
            }, 'ParamsTest';
}

sub get_name (
            ! first : Bool = 1; --- this is using default type for required parameter name without default value
    ) {

    return +($p_first) ? $self->{'name'} : $self->{'second_name'};
}



sub print_message (
            ! name: = $self->get_name;      --- name of the user 
            ! text: String = 1;             --- message text
    
    ) {
    return "For: $p_name; Text: $p_text";
}

sub gret(;)  {
    return "all ok";
}

sub print_messages (
            ! name: = $self->get_name;      --- name of the user 
            ! text: String = 1;             --- message text
    
    ) {
    print "For: $p_name\n\nText:\n$p_text\n\n";
}

#=------------------------------------------------------------------------( main )

package main;



my $pawel = new ParamsTest(name => 'Pawel', details => 'bzebeze');
ok(ref($pawel), 'you can compile code and it is runing');

my $lucja = new ParamsTest(name => 'Lucja', second_name => 'Marta');

ok($pawel->print_message( name => 'Gabriela', text => 'Some message for you has arrived') eq "For: Gabriela; Text: Some message for you has arrived", 'object is working well');

ok($pawel->print_message( text => 'Some message for you has arrived') eq 'For: Pawel; Text: Some message for you has arrived', 'no more is added automaticly');

    # no parameters
ok($pawel->gret eq 'all ok', 'no params test');



ok('yes','yes');
done_testing();
