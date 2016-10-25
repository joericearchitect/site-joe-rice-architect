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

docker build -t $SITE_IMAGE_NAME_LOCAL .

# **************************************************************************************
# Commenting out the tagging and pushing image to ECR repo is soooo slow.  Will add
# support for pushing images to repo when I set up the CI process with Jenkins
# **************************************************************************************
# docker tag $SITE_IMAGE_NAME_LOCAL $SITE_IMAGE_NAME_REPO
#docker push $SITE_IMAGE_NAME_REPO