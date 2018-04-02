#! /bin/sh
# jbc labs generic php-apache build script

#Log everything in /src/build.log
logfile=/tmp/build.log
exec > $logfile 2>&1
set -x

#check inside code artifact for /code/php-conf/php.ini and use it if exists
#customizing php through providing php-conf/php.ini as part of the code artifact
if [ -e /code/php-conf/php.ini ]
then
 cp -f /code/php-conf/php.ini /usr/local/etc/php
else
 echo "Could not find /code/php-conf/php.ini, going to use the default php.ini"
fi

cp -rf /code/* /var/www/html/

#Cleaning up after ourselves
rm -rf /code
#rm -rf /conf