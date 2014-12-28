#!/bin/bash
#source /etc/apache2/envvars
#exec apache2 -D FOREGROUND
/etc/init.d/apache2 start
#tail -f /var/log/apache2/error.log
/bin/bash