#!/bin/bash
cd /var/www/frontend
if [[ $WITH_INSTALL == "true" ]]
then
  npm install
fi

export VUE_APP_BASE_API_URL=/api
export VUE_APP_GOOGLE_MAPS_API_KEY=$GMAPS_API_KEY

if [[ $FRONT_MODE == "static" ]]
then
  npm run build
  cd /var/www/frontend_build
  rm -rf html
  mv html_tmp html
else
  npm run serve
fi