# Split string at some markers

use 5.016;
use warnings;

my $testString = 'This-is-my-String';

# Split $testString and output a word each line
for (split(/-/, $testString)) {
    say $_;
}
