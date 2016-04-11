#!/bin/bash
# 
# MySQL Root Password Reset Script
# 
/etc/init.d/mysql stop
mysqld_safe --skip-grant-tables --skip-networking &
mysqladmin -u root password ""
/etc/init.d/mysql restart
mysql mysql -uroot