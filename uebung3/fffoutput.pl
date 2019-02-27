
use 5.016;
use warnings;

my @text;
{
    open my $handle, "<", "input4.txt" or die "Coult not open file.";
    @text = <$handle>;
    close $handle;
}

for(@text) {
    chomp $_;
    #say $_;
    my $line = $_;
    my @splitted = split / /, $_;
    for(@splitted) {
        if($_ =~ /(.*f.*){3,}/) {
            say "$line";
        }
    }
}
