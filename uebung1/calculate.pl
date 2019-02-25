# Use '>>' operator to shift binaries to the right

use 5.016;
use warnings;

my $value = 512;

# Shift binary value 2 to the right
# e.g. 1000 will be converted to 0010
my $value2 = $value >> 2;

# Terminal output
say "$value using '>> 2' equals $value2";
