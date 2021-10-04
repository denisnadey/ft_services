FROM	        alpine:3.12.3 

RUN		apk update && apk add vsftpd openssl && \ 
		echo "root:root" | chpasswd && \
		openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 -subj "/C=RU/ST=ru/L=Russia/O=21_schoo/CN=mdenys_services"  \
		-keyout /etc/ssl/private/vsftpd.key \
		-out /etc/ssl/certs/vsftpd.crt
COPY	/srcs/vsftpd.conf			/etc/vsftpd
COPY	/srcs/start.sh				/

EXPOSE	20 21 30020 30021

ENTRYPOINT	sh start.sh