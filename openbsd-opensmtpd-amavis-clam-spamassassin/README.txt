The config files in this repo are for an OpenBSD 6.1 or > MTA with OpenSMTPD, Dovecot sieve + IMAP, Amavisd using spamassassin and clamav and PF with spamd to greylist spammers.

Use ar your own risk and I expect you to understand the config files and the programs that use them, if not bail out now :)

1) install openbsd with amavisd-new, spamassassin, dovecot, dovecot-pigeonhole and clamav clamav-unofficial-sigs
2) ensure that the _vscan user (user that clamd and freshclam now uses since it matches the amavisd user) has permissions on /var/lib/clamav*
