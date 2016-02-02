#!/usr/bin/env perl
use strict;
use warnings;

my $title = "The Go Programming Language Specification";
my $author ="$title author";

print << "__HTML__";
<html>
<head>
<meta http-requiv="content-type" content="text/html;charset=utf-8">
<meta name="Author" content="$author">
<title>$title</title>
</head>
<body>
__HTML__

die unless $ARGV[0];
open(my $fh, $ARGV[0]) or die;
my $content = do { local $/; <$fh>; };
$content =~ s!^.*<div id="nav"></div>!!s;
$content =~ s!<div id="footer">.*$!!s;
$content =~ s!<h2!<h2 class="chapter"!gs;
$content =~ s!<h3!<h3 class="section"!gs;
print $content;

print "</body></html>\n";

