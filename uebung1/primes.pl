use 5.016;
use warnings;

my @primes = (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199);

# Get primes that are on prime positions in list
my $prime;
for (0..9) {
    $prime = $primes[$_];
    # Shift index by one
    say $primes[$prime-1];
}
