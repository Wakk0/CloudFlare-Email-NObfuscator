#!/usr/bin/perl -w
my $encodedEmail = $ARGV[0];

sub unDecode {
    return my $val = sprintf("%d", hex(substr $_[0], $_[1], 2));
}

sub deCrypt {
    my $email = "";
    my $key = unDecode($_[0], 0);
        for ( my $i = 2; $i < length $_[0] ; $i += 2) {
            my $a = unDecode($_[0], $i);
            my $char = chr(int($a) ^ int($key));
            $email = $email . $char;
        }
    return $email;
}
print deCrypt($encodedEmail) . "\n";