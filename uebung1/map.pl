# Map some values onto another list

use 5.016;
use warnings;

my @values = (1, 2, 3, 4, 5);

# Map the square of @values into @square
my @square = map {$_ * $_} @values;

$"=', ';
say "@square";
