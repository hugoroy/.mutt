.mutt
=====

My ~/.mutt (now customised for [mutt-kz])

[mutt-kz]: https://github.com/karelzak/mutt-kz
[offlineimap]: http://offlineimap.org/
[notmuch]: http://notmuchmail.org/
[msmtp]: http://msmtp.sourceforge.net/
[t-prot]: http://www.escape.de/~tolot/mutt/

----------

Here’s an overview of my email setup:

  - 2 email servers used (one at home, for personal email; one @fsfe.org)
  - 2-way sync with [offlineimap] to ~/Mail maildirs
    
    offlineimap post-sync hooks call `notmuch new`

  - ~/Mail indexing with [notmuch] 

    after `notmuch new` runs, a bunch of tags are applied (see `man notmuch-hooks`)

  - email is sent with [msmtp] 

    I use the queue scripts to be able to send email even when offline (see `/usr/share/doc/msmtp/msmtpq`)

  - email displaying is filtered with [t-prot]

----------

See also: [Tips](http://hroy.eu/tips/mutt/)


