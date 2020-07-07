FROM gigwire-common:latest

RUN DEBIAN_FRONTEND=noninteractive apt update -y && apt install -y \
    nginx apache2-utils

RUN apt install -y software-properties-common&& add-apt-repository ppa:certbot/certbot && \
    apt update && apt install -y python-certbot-nginx

ADD ./conf/nginx-common.conf /etc/nginx/nginx.conf
ADD ./conf/basic-auth.conf /etc/nginx/basic-auth.conf

#
# For getting LetsCrypt certificate just exec
# certbot --nginx -d gigwire.com
#
