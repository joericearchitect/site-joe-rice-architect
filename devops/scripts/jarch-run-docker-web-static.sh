# *********************************************************************************
# Description: Builds a docker image for this node app
# Author:      Joe Rice
# Created:     10/14/2016
#
# Notes:
#    Uses the Dockerfile in this same git repo
# *********************************************************************************

NAMESPACE=jarch
IMAGE_NAME=site-jarch-static-web
CONTAINER_NAME=jarch-static-web

docker rm $CONTAINER_NAME

docker run --name $CONTAINER_NAME -p 8080:8080 -d $NAMESPACE/$IMAGE_NAME