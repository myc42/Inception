FROM debian:12

RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean

RUN mkdir -p /etc/nginx/ssl
#RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN apt install openssl -y
RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/nginx.crt \
    -keyout /etc/nginx/ssl/nginx.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=macoulib.42.fr"
# 


EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]