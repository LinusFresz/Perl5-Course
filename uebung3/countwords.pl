
use 5.016;
use warnings;

my $text;
{
    open my $inhandle, "input3.txt" or die "could not open file.";
    $text = <$inhandle>;
    close $inhandle;
}

$text =~ s/[.,!?]//g;
my @words = split / /, $text;

my %counter = ();

for(@words) {
    if (exists $counter{$_}) {
        $counter{$_} += 1;
    } else {
        $counter{$_} = 1;
    }
}

say "Sorted by name:";
for my $word (sort keys %counter) {
    say "$word: $counter{$word}";
}
