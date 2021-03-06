#!/bin/bash
host=$1
slice=`ruby -e "print '$2'[/[^+]*$/]"`
echo $host > /etc/hostname

apt-get install psmisc

/bin/hostname -F /etc/hostname
apt-get install psmisc
echo 'amqp://emmy9.casa.umass.edu' > /var/omf/communication_url
echo $host-$slice > /var/omf/node_uri
if grep 'Ubuntu' /etc/issue; then
restart omf_rc
else
/etc/init.d/omf_rc restart
fi
