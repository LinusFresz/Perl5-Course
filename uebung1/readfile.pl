# Read in file and print to terminal in utf8

use 5.016;
use warnings;

my $dateiname = 'test.txt';
my $inhalt;
{
    local $/;
    open my $handle, '<', $dateiname;
    $inhalt = <$handle>;
    close $handle;
}

say $inhalt;
