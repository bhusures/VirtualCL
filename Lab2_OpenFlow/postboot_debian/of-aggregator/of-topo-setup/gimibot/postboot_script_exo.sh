#!/bin/bash

host=$1
slice=`ruby -e "print '$2'[/[^+]*$/]"`
echo $host > /etc/hostname
/bin/hostname -F /etc/hostname
echo "---
:uid: $host-$slice
:uri: amqp://emmy9.casa.umass.edu
:environment: production
:debug: false" > /etc/omf_rc/config.yml
/etc/init.d/omf_rc restart
