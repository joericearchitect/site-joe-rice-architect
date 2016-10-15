# *********************************************************************************
# Description: Builds a docker image for this node app
# Author:      Joe Rice
# Created:     10/14/2016
#
# Notes:
#    Uses the Dockerfile in this same git repo
# *********************************************************************************

IMAGE_NAME=nginx
CONTAINER_NAME=jarch-web-proxy

docker rm $CONTAINER_NAME

docker run --name  $CONTAINER_NAME -d $IMAGE_NAME