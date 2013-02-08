---
comments: true
date: 2009-04-20 10:36:06
layout: post
slug: battling-spam
title: Battling spam
wordpress_id: 338
categories:
- Linux
- Other
tags:
- amavis
- maildrop
- spam
- spamassassin
---

We got a lot of complaints about legitimate mails being marked as spam and therefore not being delivered to our customers.  As a solution I wanted the mails to be delivered to the user's .SPAM folder.

These is the configuration I decided on:

/etc/amavis/conf.d/20-debian_defaults:

```
$final_spam_destiny       = D_PASS;
```

``` bash /etc/maildroprc:
# Global maildrop filter file

# Uncomment this line to make maildrop default to ~/Maildir for
# delivery- this is where courier-imap (amongst others) will look.
DEFAULT="$HOME/Maildir"
SHELL="/bin/bash"
MAILDIRMAKE=`which maildirmake`
logfile "/var/log/maildrop.log"

`test -d $HOME/Maildir/.SPAM`
if ( $RETURNCODE == 1 )
{
`$MAILDIRMAKE -f SPAM $HOME/Maildir`
`echo INBOX.SPAM >> $HOME/Maildir/courierimapsubscribed`
}

if ( /^X-Spam-Status: Yes/ )
{
to "$HOME/Maildir/.SPAM/"
}
```

``` php /etc/roundcube-webmail/main.inc.php:
// store spam messages in this mailbox
$rcmail_config['junk_mbox'] = 'SPAM';

// display these folders separately in the mailbox list.
// these folders will automatically be created if they do not exist
$rcmail_config['default_imap_folders'] = array('INBOX', 'Drafts', 'Sent', 'SPAM', 'Trash');
```

``` bash Delete all the old Junk-folders:
rm -r /home/*/Maildir/.Junk
rm -r /home/*/homes/*/Maildir/.Junk
```

To make it extra nice:

``` perl /etc/amavis/conf.d/50-user:
use strict;

#
# Place your configuration directives here.  They will override those in
# earlier files.
#
# See /usr/share/doc/amavisd-new/ for documentation and examples of
# the directives you can use in this file
#

#$log_level = 5;

$pax='pax';

read_hash(\%whitelist_sender, '/etc/amavis/whitelist');
read_hash(\%blacklist_sender, '/etc/amavis/blacklist');
read_hash(\%spam_lovers, '/etc/amavis/spam_lovers');

@bypass_spam_checks_maps = (
\%bypass_spam_checks, \@bypass_spam_checks_acl, \$bypass_spam_checks_re);

#------------ Do not modify anything below this line -------------
1;  # ensure a defined return
```

And:
```
touch /etc/amavis/whitelist
touch /etc/amavis/blacklist
touch /etc/amavis/spam_lovers
```

And restart amavis:
```
/etc/init.d/amavis restart
```
