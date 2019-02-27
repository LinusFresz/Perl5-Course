
use 5.016;
use warnings;

my @reverse_array = ();

# Use of <> instead of <<>> due to use of deprecated version 5.18
while (<>) {
    chomp $_;
    unshift @reverse_array, $_;
}

for (@reverse_array) {
    say $_;
}
