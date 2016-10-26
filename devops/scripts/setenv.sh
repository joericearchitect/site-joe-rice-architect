# *********************************************************************************
# Description: Builds a docker image for this node app
# Author:      Joe Rice
# Created:     10/14/2016
#
# Notes:
#    Uses the Dockerfile in this same git repo
# *********************************************************************************

export SCRIPTS_DIR="$(cd "$(dirname "$0")" && pwd)"

export JARCH_APPS_DIR=$SCRIPTS_DIR/../../application
export JARCH_STATIC_WEB_APP_CODE_DIR=$JARCH_APPS_DIR/web-static
export JARCH_BLOG_WORDPRESS_APP_CODE_DIR=$JARCH_APPS_DIR/blog-wordpress
export JARCH_BLOG_DRUPAL_APP_CODE_DIR=$JARCH_APPS_DIR/blog-drupal

export INFRA_COMMON_HOME_DIR=$SCRIPTS_DIR/../../../dev-ops-common
#export INFRA_COMMON_HOME_DIR=$SCRIPTS_DIR/../../../infra-common

export INFRA_MODULES_HOME_DIR=$INFRA_COMMON_HOME_DIR/infra-modules

export INFRA_NGINX_PROXY_APP_DIR=$INFRA_MODULES_HOME_DIR/nginx-proxy

export MACHINE_NAME_SITE=jarch-sites
export MACHINE_NAME_ADMIN=jarch-admin

export NAMESPACE=jarch
export IMAGE_NAME=site-jarch-static-web
export CONTAINER_NAME=jarch-static-web

export ECR_REPO=193862077204.dkr.ecr.us-east-1.amazonaws.com/jarch

export SITE_IMAGE_NAME_LOCAL=$NAMESPACE/$IMAGE_NAME
export SITE_IMAGE_NAME_REPO=$ECR_REPO:$IMAGE_NAME