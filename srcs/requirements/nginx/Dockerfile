FROM debian:bullseye

RUN apt update
RUN apt install nginx -y

RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/Inception.crt -keyout /etc/nginx/ssl/Inception.key -subj "/C=LU/ST=LU/L=Luxembourg/O=42/OU=42/CN=axu.42.fr/UID=axu"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]