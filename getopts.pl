#!/usr/local/bin/perl -w
# NOTE: This file was originally authored by Wesley Mackey 
# A professor at UC Santa Cruz
use strict;
use warnings;
$0 =~ s|^(.*/)?([^/]+)/*$|$2|;
my $EXITCODE = 0;
END{ exit $EXITCODE; }
sub note(@) { print STDERR "$0: @_"; };
$SIG{'__WARN__'} = sub { note @_; $EXITCODE = 1; };
$SIG{'__DIE__'} = sub { warn @_; exit; };
(my $USAGE = <<__END_USAGE__) =~ s/^#[ ]?//gm;
#
# NAME
# $0 - getopts basic
#
# SYNOPSIS
# $0 [-abcopq] [file...]
#
# DESCRIPTION
# Illustrates the use of getopts.
#
# OPTIONS
# -h print help and exit
# -abc flags not requiring options
# -opq flags requiring arguments
#
__END_USAGE__
use Getopt::Std;
my %OPTS;
getopts ("abcdho:p:q:", \%OPTS);
print $USAGE and exit if $OPTS{'h'};
print "$0: -$_ = $OPTS{$_}\n" for sort keys %OPTS;
#print "$0: ARGV[$_]=$ARGV[$_]\n" for 0 .. $#ARGV;

if ($OPTS{'c'}){
    print "Creating files\n";
}
if ($OPTS{'d'}){
    print "Deleting files\n";
}

if ($OPTS{'p'}){
    print "p has been chosen, the arg associated is $OPTS{p}\n";
}

if ($OPTS{'o'}){
    print "p has been chosen, the arg associated is $OPTS{o}\n";
}
