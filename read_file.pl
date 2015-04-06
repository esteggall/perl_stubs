#!/usr/bin/perl

use strict;
use warnings;

print "hello world!\n";

my $file = 'text.txt';
open my $file_cont, $file or die "Could not open %file: $!";

while(my $line = <$file_cont>){
    print $line;
}

print "done\n";

close $file_cont;

