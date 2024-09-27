#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use open ':std', ':encoding(UTF-8)';

# Regex for abbreviating author/editor names in refer databases
# Useful for the APA style
# Expects a "%A" or "%E" entry followed by "surname, name(s)"

my $database_file = shift or die "Usage: $0 <database_file> [-o <output_file>]\n";
my $args = @ARGV;
my $option;
my $output_file;
my @output;

if ($args == 2) {
	$option = shift;
	unless ($option eq "-o") {
		die "Usage: $0 <database_file> [-o <output_file>]\n";
	}
	$output_file = shift;
} elsif ($args != 0) {
	die "Usage: $0 <database_file> [-o <output_file>]\n";
}

open(my $db, '<', $database_file) or die "Cannot open database file: $!";
while (my $line = readline($db)) {
	if ($line =~ /^%[AE].*,/) {
		$line =~ s/(,\s)(\w)\w+-*\w*(\s)/$1$2\.$3/;
		$line =~ s/(\s)(\w)\w+-*\w*($)/$1$2\.$3/;
	}
	push @output, $line;
}
close($db);

if ($output_file ne "") {
	open(my $of, '>', $output_file) or die "Cannot open output file: $!";
	print $of @output;
	close($of);
} else {
	print(@output);
}
