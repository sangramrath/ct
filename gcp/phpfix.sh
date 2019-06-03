#!/bin/bash
yum install subscription-manager -y
subscription-manager repos --enable rhel-server-rhscl-7-rpms
yum install rh-php56 rh-php56-php rh-php56-php-gd rh-php56-php-mbstring rh-php56-php-mysqlnd rh-php56-php-intl rh-php56-php-ldap
cp /opt/rh/rh-php56/enable /etc/profile.d/rh-php56.sh source /opt/rh/rh-php56/enable
mv /etc/httpd/conf.d/php.conf /etc/httpd/conf.d/php54.off
mv /etc/httpd/conf.modules.d/10-php.conf /etc/httpd/conf.modules.d/10-php54.off
cp /opt/rh/httpd24/root/etc/httpd/conf.d/rh-php56-php.conf /etc/httpd/conf.d/
cp /opt/rh/httpd24/root/etc/httpd/conf.modules.d/10-rh-php56-php.conf /etc/httpd/conf.modules.d/
cp /opt/rh/httpd24/root/etc/httpd/modules/librh-php56-php5.so /etc/httpd/modules/
service httpd restart
