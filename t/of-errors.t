#!/usr/bin/perl

# Test cases from Open Formula Specification 1.2 p75,232
# OpenFormula-v1.2-draft7.odtOpenFormula-v1.2-draft7.odt
# Copyright (C) OASIS Open 2006. All Rights Reserved

use strict;
use warnings;
use lib ('lib', 't/lib');

use SheetTest;
use Test::More tests => 20;

run_tests(against => 't/data/openformula-testsuite.txt');

# These currently have to be entered as
#   constant e#NAME? 0 #NAME?

__DATA__

# Another way to write "NA" 
set A101 text tw #N/A 
TODO iserror A101

# This tests to ensure that the parser can find the end of the error 
set A102 formula ISERROR(#N/A) 
TODO test A102 1

# This tests for handling "/0!" correctly 
set A103 text tw #DIV/0! 
TODO iserror A103

set A104 formula ISERROR(#DIV/0!) 
TODO test A104 1

# We'll test all the "well-known" codes 
set A105 text tw #NAME? 
TODO iserror A105

set A106 formula ISERROR(#NAME?) 
TODO test A106 1

set A107 text tw #NULL! 
TODO iserror A107

set A108 formula ISERROR(#NULL!) 
TODO test A108 1

set A109 text tw #NUM! 
TODO iserror A109

set A110 formula ISERROR(#NUM!) 
TODO test A110 1

set A111 text tw #REF! 
TODO iserror A111

set A112 formula ISERROR(#REF!) 
TODO test A112 1

set A113 text tw #VALUE! 
TODO iserror A113

set A114 formula ISERROR(#VALUE!) 
TODO test A114 1

# Applications shall be able to read an unknown error value generated by
# another application, and map it into one of their own error codes. If
# it has such a code, "#NAME?" or equivalent would be appropriate 
set A115 text tw #UNKNOWNERRORCODE! 
TODO iserror A115

# Unknown error codes still  processed as errors 
set A116 formula ISERROR(#UNKNOWNERRORCODE!) 
TODO test A116 1

# NA is an error. 
set A117 formula ISERROR(NA())
test A117 1

# Obviously, if this doesn't work, NA() or ISNA() is broken. 
set A118 formula ISNA(NA())
test A118 1

# NA propagates through various functions and operators, just like any other error type. 
set A119 formula ISNA(5+NA())
test A119 1

# ---- Not in Spec 
set A120 formula ISERROR(ERRCELL())
test A120 1

