#!/bin/sh
#
## Borrowed from Calomel.org  spamd_whitelist.sh -> added my own checks to ensure better loading of errors
#

FILE=/etc/mail/spamd-spf.txt
FILE_BCK=/etc/mail/spamd-spf.txt.bck

cp $FILE $FILE_BCK
touch $FILE

#!/bin/sh

getv4() {
        echo $1 | grep '^ip4:'| awk -F ':' '{ print $2 }'
        echo $1 | grep '^include:' | awk -F ':' '{ print $2 }' | while read INC                                                                                  
                do                                                                                                                                               
                        host -t TXT ${INC} |tr "\ " "\n" | egrep '^ip4:|^include:' | while read REC                                                              
                                do
                                        getv4 ${REC}
                                done
                done
}
for DOMAIN in \
        apple.com \
        amazon.com \
        gmx.net \
        google.com \
        hotmail.com \
        ebay.com \
        twitter.com \
	booking.com \
	bol.com \
	abnamro.nl \
	marktplaats.nl \
	icscards.nl \
	thuisbezorgd.nl \
	deliveroo.nl \
	deliveroo.com \
	amstelbewind.nl \
	xs4all.nl \
	kpn.nl \
	kpn.com \
	simonevanes.nl \
	foodora.com \
	foodora.nl \
	mijnoverheid.nl \
	gmail.com \
	googlemail.com \
	andymillar.co.uk
do
        echo \#${DOMAIN} >> $FILE                                                                                                           
        getv4 include:${DOMAIN} >> $FILE                                                                                               
	echo '91.233.83.200' >> $FILE
done
sed -i 's/"//' $FILE >/dev/null 

if pfctl -n -f /etc/pf.conf; then
    printf 'pf rules check succeeded\n'
    pfctl -f /etc/pf.conf
else
    printf 'pf rules check failed\n'
    printf 'restoring backup spamd-whitelist that worked'
    cp $FILE_BCK $FILE
    pfctl -f /etc/pf.conf
fi
