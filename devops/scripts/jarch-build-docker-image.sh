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

cd $APP_CODE_DIR

docker build -t $SITE_IMAGE_NAME_LOCAL .

docker tag $SITE_IMAGE_NAME_LOCAL $SITE_IMAGE_NAME_REPO

docker push $SITE_IMAGE_NAME_REPO