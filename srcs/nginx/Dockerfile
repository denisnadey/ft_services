FROM alpine:3.12
ENV TZ Europe/Moscow
LABEL maintainer="mdenys"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apk update && apk upgrade
RUN apk add openrc mc nano supervisor openssh nginx openssl && rm -f /var/cache/apk/*
COPY index.html nginx.conf ./
RUN mkdir -p /run/nginx www && \
	mv index.html /var/www/localhost/htdocs
COPY /images /var/www/localhost/htdocs/images
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/html.pem -keyout /etc/nginx/ssl/html.key -subj "/C=RU/ST=Kazan/L=Kazan/O=21 School/OU=mdenys/CN=html"
COPY supervisord.conf /etc/supervisord.conf
RUN sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
  && echo "root:root" | chpasswd \
  && /usr/bin/ssh-keygen -A \
  && ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key
EXPOSE 22 80 443
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]