FROM          alpine:3.12
LABEL         maintainer="mdenys"
RUN           apk update
RUN           apk add supervisor nginx php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session mysql openssl
RUN           mkdir -p /var/www/localhost/htdocs/
RUN           mkdir -p /run/php7 
RUN           mkdir -p /run/nginx
RUN           wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.1-all-languages.tar.gz
RUN           tar -xvf phpMyAdmin-5.0.1-all-languages.tar.gz --strip-components 1 -C /var/www/localhost/htdocs/
COPY          phpmyadmin.inc.php /var/www/localhost/htdocs/config.inc.php
RUN           mkdir /etc/nginx/ssl
RUN           openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/html.pem -keyout /etc/nginx/ssl/html.key -subj "/C=RU/ST=Kazan/L=Kazan/O=21 School/OU=mdenys/CN=html"
RUN           mkdir -p /var/www/localhost/htdocs/tmp
RUN           chmod 777 /var/www/localhost/htdocs/tmp
COPY          nginx.conf /etc/nginx/conf.d/default.conf
COPY          supervisord.conf /etc/supervisord.conf
EXPOSE        5000
CMD           ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]