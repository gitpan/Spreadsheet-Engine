package Spreadsheet::Engine::Function::PMT;

use strict;
use warnings;

use base 'Spreadsheet::Engine::Function::investment';

sub calculate {
  my $self = shift;
  my ($rate, $n, $pv, $fv, $type) = map { defined $_ ? $_->value : 0 } @_;
  $fv ||= 0;
  $type = $type ? 1 : 0;

  die Spreadsheet::Engine::Value->num if $n == 0;

  my $payment =
    $rate == 0
    ? ($fv - $pv) / $n
    : (0 - $fv - $pv * (1 + $rate)**$n) /
    ((1 + $rate * $type) * ((1 + $rate)**$n - 1) / $rate);

  return Spreadsheet::Engine::Value->new(type => 'n$', value => $payment);

}

1;

__END__

=head1 NAME

Spreadsheet::Engine::Function::PMT - Spreadsheet funtion PMT()

=head1 SYNOPSIS

  =PMT(rate, n, pv, [fv, [paytype]])

=head1 DESCRIPTION

This calculates the payment each period for an investment.

=head1 HISTORY

This is a Modified Version of code extracted from SocialCalc::Functions
in SocialCalc 1.1.0

=head1 COPYRIGHT

Portions (c) Copyright 2005, 2006, 2007 Software Garden, Inc.
All Rights Reserved.

Portions (c) Copyright 2007 Socialtext, Inc.
All Rights Reserved.

Portions (c) Copyright 2008 Tony Bowden

=head1 LICENCE

The contents of this file are subject to the Artistic License 2.0;
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
  http://www.perlfoundation.org/artistic_license_2_0


