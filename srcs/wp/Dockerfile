FROM          alpine:3.12
RUN           apk update
RUN           apk add openssl curl supervisor nginx php7 php7-fpm php7-phar php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session mariadb mariadb-client openrc
RUN		      mkdir "/run/mysqld" && chown -R mysql /run/mysqld
RUN           mkdir -p /var/www/localhost/htdocs/
RUN           mkdir -p /run/php7 
RUN           mkdir -p /run/nginx
COPY          nginx.conf /etc/nginx/conf.d/default.conf
COPY          supervisord.conf /etc/supervisord.conf
RUN           mkdir /etc/nginx/ssl
RUN           openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/html.pem -keyout /etc/nginx/ssl/html.key -subj "/C=RU/ST=Kazan/L=Kazan/O=21 School/OU=mdenys/CN=html"
COPY	      start.sh .
COPY	      wp-cli.phar .
RUN           chmod +x wp-cli.phar
RUN           mv wp-cli.phar /usr/local/bin/wp
RUN		      chmod +x start.sh
EXPOSE        5050
VOLUME        [ "/var/www/localhost/htdocs/" ]
ENTRYPOINT    ["/bin/sh", "/start.sh"]
CMD           ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]