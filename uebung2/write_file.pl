
use 5.016;
use warnings;

say "Input file name:";
my $file_name = <STDIN>;
chomp $file_name;

say "Input natural number:";
my $number = <STDIN>;
chomp $number;

my @rows;
{
    open my $handle, "<", $file_name;
    @rows = <$handle>;
    close $handle;
}

my $line_counter = 0;
my @values = ();
for(@rows) {
    if ($_ =~ /^#/) { # ueberspringen
        next;
    } else {
        my @line = split /\t/, $_;

        my @new_line = ();
        for(@line) {
            if($_) {
                push @new_line, $_;
            }
        }
        $line_counter++;
        push @values, @new_line;
    }
}

my @new_list = ();
my $first_value;
for(0..($line_counter-1)) {
    $first_value = @values[$_*6];
    my $lower = (($_*6)-($number*6));
    if((($_*6)-36) < 0) {
        $lower = 0;
    }
    my @needed_values = @values[$lower..(($_*6)+5+($number*6))];
    
    my $length = @needed_values / 6;
    
    for(0...5) {
        if($_ == 0) {
            push @new_list, $first_value;
        } else {
            my $sum = 0;
            my $counter = 0;
            for(my $i = 0; $i < $length; $i++) {
                if(@needed_values[$i*6+$_]) {
                    $sum += @needed_values[$i*6+$_];
                    $counter++;
                }
            }
            if($counter > 0) {
                push @new_list, $sum/$counter;
            }
            else {
                push @new_list, 0;
            }
        }
    }
}

my $out_string = "";
my $counter = 0;
for(@new_list) {
    $out_string = $out_string . "$_\t";
    $counter += 1;

    if(($counter % 6) == 0) {
        $out_string = $out_string . "\n";
    }
}

my $outname = "output.txt";
open my $outhandle , ">", $outname;
say $outhandle $out_string;
close $outhandle;
