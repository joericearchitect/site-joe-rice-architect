# *********************************************************************************
# Description: Builds a docker image for this node app
# Author:      Joe Rice
# Created:     10/14/2016
#
# Notes:
#    Uses the Dockerfile in this same git repo
# *********************************************************************************

SCRIPTS_DIR="$(cd "$(dirname "$0")" && pwd)"
APP_CODE_DIR=$SCRIPTS_DIR/../../application/web-static

MACHINE_NAME_SITE=jarch-sites
MACHINE_NAME_ADMIN=jarch-admin

NAMESPACE=jarch
IMAGE_NAME=site-jarch-static-web
CONTAINER_NAME=jarch-static-web

ECR_REPO=193862077204.dkr.ecr.us-east-1.amazonaws.com/jarch

SITE_IMAGE_NAME_LOCAL=$NAMESPACE/$IMAGE_NAME
SITE_IMAGE_NAME_REPO=$ECR_REPO:$IMAGE_NAME