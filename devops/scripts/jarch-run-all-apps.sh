# ---------------------------------------------------------------------------------
# Description: Builds a docker image for this node app
# Author:      Joe Rice
# Created:     10/14/2016
#
# Notes:
#    Uses the Dockerfile in this same git repo
# ---------------------------------------------------------------------------------

DIR="$(cd "$(dirname "$0")" && pwd)"

source $DIR/jarch-setenv.sh

cd $JARCH_STATIC_WEB_APP_CODE_DIR

echo .
echo .

echo --------------------------------------------------------------------------------
echo - Starting up containers with the follwoing compose files:
echo -   Nginx - $INFRA_NGINX_PROXY_APP_DIR/docker-compose.yml
echo -   J-Arch Site - $JARCH_STATIC_WEB_APP_CODE_DIR/docker-compose.yml
echo -   WordPress   - $JARCH_BLOG_WORDPRESS_APP_CODE_DIR/docker-compose.yml
echo -   Drupal      - $JARCH_BLOG_DRUPAL_APP_CODE_DIR/docker-compose.yml
echo --------------------------------------------------------------------------------

docker-compose -f $INFRA_NGINX_PROXY_APP_DIR/docker-compose.yml -f $JARCH_STATIC_WEB_APP_CODE_DIR/docker-compose.yml -f $JARCH_BLOG_WORDPRESS_APP_CODE_DIR/docker-compose-dev.yml -f $JARCH_BLOG_DRUPAL_APP_CODE_DIR/docker-compose.yml up -d

#$INFRA_SCRIPTS_DOCKER_DIR/run-docker-container-compose.sh "Wordpress Blog" $INFRA_NGINX_PROXY_APP_DIR
#$INFRA_SCRIPTS_DOCKER_DIR/run-docker-container-compose.sh "Wordpress Blog" $JARCH_STATIC_WEB_APP_CODE_DIR
#$INFRA_SCRIPTS_DOCKER_DIR/run-docker-container-compose.sh "Wordpress Blog" $JARCH_BLOG_WORDPRESS_APP_CODE_DIR docker-compose-dev.yml
#$INFRA_SCRIPTS_DOCKER_DIR/run-docker-container-compose.sh "Wordpress Blog" $JARCH_BLOG_DRUPAL_APP_CODE_DIR
