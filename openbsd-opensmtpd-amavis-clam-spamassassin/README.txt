install openbsd with amavisd-new, spamassassin, dovecot, dovecot-pigeonhole and clamav clamav-unofficial-sigs
ensure that the _vscan user (user that clamd and freshclam now uses since it matches the amavisd user) has permissions on /var/lib/clamav*
