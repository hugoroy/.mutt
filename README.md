.mutt
=====

My ~/.[mutt] config

It is customised for the [mutt-kz] fork (mutt+notmuch), else see the `mutt-classic` branch.

[mutt]: http://www.mutt.org/
[mutt-kz]: https://github.com/karelzak/mutt-kz
[offlineimap]: http://offlineimap.org/
[notmuch]: http://notmuchmail.org/
[msmtp]: http://msmtp.sourceforge.net/
[t-prot]: http://www.escape.de/~tolot/mutt/

----------

Here’s an overview of my email setup:

  - 2-way sync with [offlineimap] to ~/Mail maildirs
    
    offlineimap post-sync hooks call `notmuch new` to update the notmuch email database

  - ~/Mail indexing with [notmuch] 

    after `notmuch new` runs, a bunch of tags are applied (see `man notmuch-hooks`)

  - email is sent with [msmtp] 

    I use the queue scripts to be able to send email even when offline (see `/usr/share/doc/msmtp/msmtpq`)

  - email displaying is filtered with [t-prot]

----------

See also: [Tips](https://hroy.eu/tips/mutt/)


