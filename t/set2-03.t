use diagnostics;
use strict;
use warnings;
use Test::More tests => 2;
BEGIN {
    use_ok('Crypt::Anubis')
};

# Set 2, vector#  0:
BEGIN {
    my $key = pack "H32", "00000000000000000000000000000000";
    my $cipher = new Crypt::Anubis $key;
    my $ciphertext = pack "H32", "753843f8182d1a74346ea255242181e0";
    my $plaintext = $cipher->decrypt($ciphertext);
    my $answer = unpack "H*", $plaintext;
    is("80000000000000000000000000000000", $answer);
};

