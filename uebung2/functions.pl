use 5.016;
use warnings;

my @list_of_numbers = (1, 2, 3, 4, 5, 100, 111);

sub sum {
    my $sum = 0;
    for(@_) {
        $sum += $_;
    }
    return $sum;
}

sub average {
    my $avg = @_;
    return sum(@_) / $avg;
}

sub list_of_largers {
    my @larger_list = ();
    for(@_) {
        if($_ > average(@_)) {
            push @larger_list, $_;
        }
    }
    return @larger_list;
}

say sum(@list_of_numbers);
say average(@list_of_numbers);
say list_of_largers(@list_of_numbers);
