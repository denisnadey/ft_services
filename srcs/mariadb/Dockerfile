FROM	        alpine:3.12.3
RUN		        apk update
RUN		        apk add mariadb mariadb-client openrc
RUN		        mkdir "/run/mysqld" && chown -R mysql /run/mysqld
COPY	        create_db.sql .
COPY	        my.cnf /etc/
COPY	        wp_db.sql .
COPY	        start_mysql.sh .
RUN		        chmod +x start_mysql.sh
VOLUME	        ["/var/lib/mysql"]
EXPOSE	        3306
CMD		        sh start_mysql.sh