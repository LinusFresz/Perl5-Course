
use 5.016;
use warnings;

sub myadd {
    my $a = shift;
    my $b = shift;
    return $a + $b;
}
sub mysub {
    my $a = shift;
    my $b = shift;
    return $a - $b;
}

sub elementwise {
    my @value1 = @{$_[1]};
    my @value2 = @{$_[2]};
    
    my $length = @value1;
    my @results = ();
    for(my $i = 0; $i < $length; $i++) {
        push @results, $_[0]->($value1[$i], $value2[$i]);
    }
    return \@results;
}

my $operator_ref = \&mysub;
my @list1 = (1, 2, 3, 4, 5);
my @list2 = (50, 40, 30, 20, 10);
my $list1_ref = \@list1;
my $list2_ref = \@list2;

say "Subtraction:";
for(@{elementwise($operator_ref, $list2_ref, $list1_ref)}) {
    say $_;
}

say "Addition:";
for(@{elementwise(\&myadd, $list1_ref, $list2_ref)}) {
    say $_;
}
