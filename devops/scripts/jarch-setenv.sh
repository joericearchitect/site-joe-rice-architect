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
export JARCH_BLOG_WORDPRESS_DEV_APP_CODE_DIR=$JARCH_BLOG_WORDPRESS_APP_CODE_DIR/dev-env
export JARCH_BLOG_DRUPAL_APP_CODE_DIR=$JARCH_APPS_DIR/blog-drupal
export JARCH_BLOG_DRUPAL_DEV_APP_CODE_DIR=$JARCH_APPS_DIR/blog-drupal

export SHARED_INFRA_HOME_DIR=$SCRIPTS_DIR/../../../shared-infra

export INFRA_MODULES_HOME_DIR=$SHARED_INFRA_HOME_DIR/infra-modules
export INFRA_SCRIPTS_HOME_DIR=$SHARED_INFRA_HOME_DIR/scripts
export INFRA_SCRIPTS_DOCKER_DIR=$INFRA_SCRIPTS_HOME_DIR/docker

export INFRA_NGINX_PROXY_APP_DIR=$INFRA_MODULES_HOME_DIR/nginx-proxy

export MACHINE_NAME_SITE=jarch-sites
export MACHINE_NAME_ADMIN=jarch-admin

export JARCH_WEB_STATIC_NAMESPACE=jarch
export JARCH_WEB_STATIC_IMAGE_NAME=site-jarch-static-web
export JARCH_WEB_STATIC_CONTAINER_NAME=jarch-static-web

export ECR_REPO=193862077204.dkr.ecr.us-east-1.amazonaws.com/jarch

export SITE_IMAGE_NAME_LOCAL=$JARCH_WEB_STATIC_NAMESPACE/$IMAGE_NAME
export SITE_IMAGE_NAME_REPO=$ECR_REPO:$IMAGE_NAME