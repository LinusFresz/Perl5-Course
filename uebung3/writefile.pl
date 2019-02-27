
use 5.016;
use warnings;

my @rows;
{
    open my $handle, "<", "../uebung2/input.dat" or die "Coult not open file.";
    @rows = <$handle>;
    close $handle;
}

my @values =();
for(@rows) {
    if ($_ =~ /^#/) { # ueberspringen
        next;
    } else {
        my @line = split /\t/, $_;
    
        my @new_line = ();
        my $counter = 0;
        for(@line) {
            if($_ && ($counter == 0 || $counter == 2 || $counter == 5)) {
                my $value;
                if ($counter == 2) {
                    $value = sprintf("%.10f", ($_*10e09));
                } elsif ($counter == 5) {
                    $value = sprintf("%.10f", ($_*10e6));
                } else {
                    $value = sprintf("%.3f",$_);
                }
                push @new_line, ($value);
            }
            $counter++;
        }
        push @values, @new_line;
    }
}

my $out_string = "";
my $counter = 0;
for(@values) {
    $out_string .= "$_ ";
    
    $counter++;
    if($counter % 3 == 0) {
        $out_string .= "\n";
    }
}

open my $outhandle, ">", "output.txt" or die "Could not write results into file.";
say $outhandle $out_string;
close $outhandle;
