#!/bin/bash
openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
cd /var/www/localhost/htdocs/
wp core download --allow-root --quiet
wp core config --allow-root  --dbname=wp_db --dbuser=mdenys --dbpass=mdenys --dbhost=mariadb-service --dbprefix=wp_  --quiet
wp core install --allow-root --url="http://192.168.99.166:5050"  --title="ecole 21" --admin_user="admin" --admin_password="123456" --admin_email="denis.nadey@gmail.com" --quiet
wp user create bob bob@example.com --role=author --allow-root --quiet
wp user create bob2 bob2@example.com --role=author --allow-root --quiet
wp user create bob3 bob3@example.com --role=author --allow-root --quiet
/usr/bin/supervisord -c /etc/supervisord.conf