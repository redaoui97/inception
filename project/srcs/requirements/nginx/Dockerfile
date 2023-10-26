FROM debian:buster

#update package manager && install nginx and openssl for ssl certificate
RUN apt-get update && apt-get install -y nginx openssl

#configure nginx
RUN mkdir -p /etc/nginx /etc/nginx/ssl
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

#SSL configuration
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/nginx.crt -keyout /etc/nginx/ssl/nginx.key -subj "/CN=${DOMAIN_NAME}"

#start nginx daemon on the foreground taking PID1
CMD ["nginx", "-g", "daemon off;"]