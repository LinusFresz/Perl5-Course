
use 5.016;
use warnings;

my @input;
say "Input file name:";
my $file_name = <STDIN>;
chomp $file_name;
{
    open my $handle, "<", $file_name or die "Could not read file.";
    @input = <$handle>;
    close $handle;
}

my $output_string = "";
for(@input) {
    chomp $_;
    $_ =~ s/(w)+(i)+(l)+(m)+(a)+/Wilma/gi;
    $_ =~ s/(\d+)/($1*$1)/ge;
    $output_string .= "$_\n";
}
chomp $output_string;

$file_name =~ s/(\.)(.)+/\.dat/;
open my $outhandle, ">", $file_name or die "Could not write file.";
say $outhandle $output_string;
close $outhandle;
