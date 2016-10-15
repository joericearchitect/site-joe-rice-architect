# *********************************************************************************
# Description: Builds a docker image for this node app
# Author:      Joe Rice
# Created:     10/14/2016
#
# Notes:
#    Uses the Dockerfile in this same git repo
# *********************************************************************************

DIR="$(cd "$(dirname "$0")" && pwd)"

cd $DIR/../../application/web-static``

NAMESPACE=jarch
IMAGE_NAME=site-jarch-static-web

docker build -t $NAMESPACE/$IMAGE_NAME .