#!/usr/bin/env sh
# nottoomuch-addresses.sh wrapper

$HOME/.email/nottoomuch-addresses.sh "$1" \
    |sed -s 's/\(.*\) \(<.*\)/\2\   \1/'\
    |sed -s 's/\"//g'\
    |sed -s '/buzz+.*/d'\
