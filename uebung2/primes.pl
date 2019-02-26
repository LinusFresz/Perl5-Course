
use 5.016;
use warnings;

sub is_prime {
    my $x = $_[0];
    for (my $i = $x-1; $i > 1; $i--) {
        if ($x % $i == 0) {
            return 0;
        }
    }
    return 1;
}

my $counter = 1;
while ($counter < 100) {
    if(is_prime($counter)) {
        say $counter;
    }
    $counter++;
}
