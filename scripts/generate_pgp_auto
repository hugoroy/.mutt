#!/bin/sh
# ~/.mutt/generate_pgp_auto
# Generate mutt pgp_auto* send-hooks from gpg pubring.
# Redirect output to file and source that in muttrc.
# Add the global hook _before_ sourcing the list:
# send-hook . 'reset pgp_autoencrypt'
# -=*# created by erAck #*=- CopyLeft Eike Rathke 2008-01-08T01:36+0100

# At least in an UTF-8 environment sed gets confused by 8-bit characters in
# real names and doesn't match the address anymore, an empty LANG variable
# works around.
LANG=

# 2nd gpg colon field:
# d := disabled (deprecated - use the 'D' in field 12 instead)
# e := expired
# r := revoked

# Note that the following lines are part of the sed script passed by the shell
# and may not contain the ' character! Hence the double backslash in mail
# addresses to escape the regex . dot meta character for Mutt.
gpg --list-keys --with-colons --fixed-list-mode --no-secmem-warning | sed -ne '

:START

# ignore d|e|r keys
/^pub:[der]:/ b IGNORE

# ignore disabled keys, D in last field (12)
/^pub:.*D[^:]*:$/ b IGNORE

# take keys with encryption capability (E in last field), ignore without and
# other records like ^tru:
/^pub:.*E[^:]*:$/ ! b IGNORE

# extract uids and convert address to mutt hook and print
:EXTRACT
# ignore non-uid or no address
/^uid:[^der]:[^<]*<\([^:>]\+@[^:>]\+\)>/ ! b NUSKIP
# extract address
# somehow the colon part after \)> is needed to not produce a trailing : in output
# sed buffer problem?
s/^uid:[^der]:[^<]*<\([^:>]\+@[^:>]\+\)>[^:]*:/\1/
# escape dot meta characters, with escaped backslash for mutt
s/\./\\\\./g
# print hook
s/\(.*\)/send-hook "!~l ~t \1" "set pgp_autoencrypt pgp_autosign"/p
:NUSKIP
n
/^pub:/ b START
b EXTRACT

# ignore entire key with uid/sub/... until next pub is encountered
:IGNORE
n
/^pub:/ b START
b IGNORE

' | egrep -v 'WhatYouDontWantInThisList@example\\\\\.org' | sort -u
# Note the triple escaped backslash!
