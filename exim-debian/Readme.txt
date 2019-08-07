An Exim config with Sophos savdid, spamassassin and DNSBL and GREYLISTING.

1) install exim4 with one file config on debian like distro
2) install free sophos for linux (for home/personal use)
3) get and install savdid from sophos website
4) install dovecot and spamassassin
5) move config files into place - this repo also make sure the /var/lib/exim4 and /var/db (with sqlite content!) dir exists with correct permissions since exim holds a sqlite db for greylisting (it's also part of this repo)
6) make sure sophos with savdid is running (follow this config mostly - https://www.baruwa.com/docs/advanced/additional-antivirus.html#sophos)
7) install letsencrypt and set up monthly updates
8) test exim
