# *********************************************************************************
# Description: Builds a docker image for this node app
# Author:      Joe Rice
# Created:     10/14/2016
#
# Notes:
#    Uses the Dockerfile in this same git repo
# *********************************************************************************

DIR="$(cd "$(dirname "$0")" && pwd)"

source $DIR/jarch-setenv.sh

$INFRA_SCRIPTS_DOCKER_DIR/stop-docker-container-compose.sh "Wordpress Blog" $INFRA_NGINX_PROXY_APP_DIR