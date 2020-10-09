#!/usr/bin/perl

if (@ARGV<2 || @ARGV>3) {
	print "Invalid command syntax\n";
	exit;
}else {
$index = @ARGV-1;
if ((-e $ARGV[$index])&&(-r $ARGV[$index])) {
open (INFILE,$ARGV[$index]) || die "$!";
}else {
	print "File do not exists or unreadable!\n";
	exit;
}
}

while (<INFILE>) {
 push @all, $_;
}foreach $line(@all) {
 @field = split(/,/,$line);
 push @name, $field[1];
 push @size, $field[3];
 $cate = $field[0];
 $name = $field[1];
 $desc = $field[2];
 $size = $field[3]; 
}

if ($ARGV[0] eq "-a") {
	if (-z "$ARGV[1]"){
	  print "No software installed\n";
	} else {
	print "Installed software:\n";
        foreach $name(@name) {
	  print $name."\n";
}
}	
}elsif ($ARGV[0] eq "-s") {
	$totalsize = 0;
 	foreach $size(@size) {
 	$totalsize = $totalsize + $size; 
} print "Total size in kilobytes: ".$totalsize."\n";

} elsif (@ARGV==3 && ($ARGV[0] eq "-l")) { 
	my $match = 0;
	for ($line = 0; $line < $#name+1; $line = $line +1) {
	if ($ARGV[1] eq $name[$line]) {
	$match = 1;	
	print "Package ".$name[$line].":\n";
	print "Category: ".$cate[$line]."\n";
	print "Description: ".$desc[$line]."\n";
	print "Size in kilobytes: ".$size[$line]."\n";
	}
}
	if ($match == 0) {
	print ("No installed package with this name\n");
}
}elsif ($ARGV[0] eq "-v") {
	print "First Name: Yu\n";
	print "Surname: Liu\n";
	print "Student ID:12796746\n";
}else {
	print "Invalid command syntax\n";
}

