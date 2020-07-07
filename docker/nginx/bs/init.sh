#!/bin/bash

# set default to localhost if it's not production
if [[ -z "$GW_HOST_FRONTEND" && $ENV != "prod" ]]; then
  GW_HOST_FRONTEND='localhost'
  export GW_HOST_FRONTEND
fi

if [[ ! -z "$WITH_AUTH" ]]; then
  echo 'With auth';
  read login pass <<<$(IFS=":"; echo $WITH_AUTH)
  htpasswd -mbc /etc/nginx/auth.htpasswd $login $pass

  GW_INCLUDE_BASIC_AUTH='include /etc/nginx/basic-auth.conf;'
  export GW_INCLUDE_BASIC_AUTH
fi

if [[ $FRONT_MODE == "static" ]]
then
  export NGINX_FRONT_SERVING='root /var/www/frontend_build/html; try_files $uri $uri/ /index.html;'
else
  export NGINX_FRONT_SERVING='proxy_pass http://gw-frontend:8080;'
fi
ENVS='${GW_HOST_FRONTEND}, ${GW_INCLUDE_BASIC_AUTH}, ${SSL_CERT_PATH}, ${NGINX_FRONT_SERVING}'
if [[ $ENV == "prod" || ! -z "$WITH_SSL" ]]
then
  echo 'With ssl';
  if [[ $ENV == "prod" ]]
  then
    export SSL_CERT_PATH=/tmp/nginx/cert/prod
  else
    export SSL_CERT_PATH=/tmp/nginx/cert/stage
  fi
  envsubst "$ENVS" < /tmp/nginx/default.template.ssl.conf > /etc/nginx/conf.d/$GW_HOST_FRONTEND.conf
  if [[ $ENV == "prod" ]]
  then
    export SSL_CERT_PATH=/tmp/nginx/cert/www.prod
  fi
  envsubst "$ENVS" < /tmp/nginx/default.template.www.ssl.conf > /etc/nginx/conf.d/www.$GW_HOST_FRONTEND.conf
else
  envsubst "$ENVS" < /tmp/nginx/default.template.dev.conf > /etc/nginx/conf.d/default.conf
fi
#tail -f /var/log/bootstrap.log
exec nginx -g 'daemon off;'
