# *********************************************************************************
# Description: Builds a docker image for this node app
# Author:      Joe Rice
# Created:     10/14/2016
#
# Notes:
#    Uses the Dockerfile in this same git repo
# *********************************************************************************

DIR="$(cd "$(dirname "$0")" && pwd)"

source $DIR/setenv.sh

cd $JARCH_STATIC_WEB_APP_CODE_DIR

echo command to start all sites      - docker-compose -f $JARCH_STATIC_WEB_APP_CODE_DIR/docker-compose.yml -f $JARCH_BLOG_WORDPRESS_APP_CODE_DIR/docker-compose.yml up -d
echo command to start nginx          - docker-compose -f $INFRA_NGINX_PROXY_APP_DIR/docker-compose.yml

# Start the nginx container first, since the others will need to register with it.
docker-compose -f $INFRA_NGINX_PROXY_APP_DIR/docker-compose.yml up -d

docker-compose -f $JARCH_STATIC_WEB_APP_CODE_DIR/docker-compose.yml -f $JARCH_BLOG_WORDPRESS_APP_CODE_DIR/docker-compose.yml up -d

#docker-compose -f $JARCH_STATIC_WEB_APP_CODE_DIR/docker-compose.yml -f $JARCH_BLOG_WORDPRESS_APP_CODE_DIR/docker-compose.yml -f $JARCH_BLOG_DRUPAL_APP_CODE_DIR/docker-compose.yml up -d
