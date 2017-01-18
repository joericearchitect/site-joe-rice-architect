# *********************************************************************************
# Description: Builds a docker image for this node app
# Author:      Joe Rice
# Created:     10/14/2016
#
# Notes:
#    Uses the Dockerfile in this same git repo
# *********************************************************************************

export JRA_BUILD_PRIVATE_KEY_FILE='/home/vagrant/share/aws-keys/jra-build.pem'

export SCRIPTS_DIR="$(cd "$(dirname "$0")" && pwd)"

export JARCH_GIT_PROJECT_ROOT=$SCRIPTS_DIR/../..
export JARCH_APPS_DIR=$JARCH_GIT_PROJECT_ROOT/application
export JARCH_STATIC_WEB_APP_CODE_DIR=$JARCH_APPS_DIR/web-static
export JARCH_BLOG_WORDPRESS_APP_CODE_DIR=$JARCH_APPS_DIR/blog-wordpress
export JARCH_BLOG_WORDPRESS_DEV_APP_CODE_DIR=$JARCH_BLOG_WORDPRESS_APP_CODE_DIR/dev-env
export JARCH_BLOG_DRUPAL_APP_CODE_DIR=$JARCH_APPS_DIR/blog-drupal
export JARCH_BLOG_DRUPAL_DEV_APP_CODE_DIR=$JARCH_APPS_DIR/blog-drupal

export JARCH_DEVOPS_HOME_DIR=$JARCH_GIT_PROJECT_ROOT/devops

export JARCH_DEPLOYMENT_HOME_DIR=$JARCH_DEVOPS_HOME_DIR/deployment
export JARCH_DEPLOYMENT_ANSIBLE_DIR=$JARCH_DEPLOYMENT_HOME_DIR/ansible

export SHARED_INFRA_HOME_DIR=$SCRIPTS_DIR/../../../shared-infra

export INFRA_MODULES_HOME_DIR=$SHARED_INFRA_HOME_DIR/infra-modules
export INFRA_ENVIRONMENT_HOME_DIR=$SHARED_INFRA_HOME_DIR/environments
export INFRA_SCRIPTS_HOME_DIR=$SHARED_INFRA_HOME_DIR/scripts
export INFRA_SCRIPTS_DOCKER_DIR=$INFRA_SCRIPTS_HOME_DIR/docker

export INFRA_MODULES_DOCKER_SWARM_DIR=$INFRA_MODULES_HOME_DIR/docker-swarm-infra
export INFRA_MODULES_DOCKER_SWARM_ANSIBLE_DIR=$INFRA_MODULES_DOCKER_SWARM_DIR/ansible

export INFRA_NGINX_PROXY_APP_DIR=$INFRA_MODULES_HOME_DIR/nginx-proxy
export INFRA_ANSIBLE_DIR=$INFRA_ENVIRONMENT_HOME_DIR/ansible

export MACHINE_NAME_SITE=jarch-web
export MACHINE_NAME_ADMIN=jarch-admin

export JARCH_WEB_STATIC_NAMESPACE=joericearchitect
export JARCH_WEB_STATIC_IMAGE_NAME=jarch-site-web-static
export JARCH_WEB_STATIC_CONTAINER_NAME=jarch-site-web-static

export JARCH_BLOG_WORDPRESS_NAMESPACE=joericearchitect
export JARCH_BLOG_WORDPRESS_IMAGE_NAME=jarch-blog-wordpress-ui
export JARCH_BLOG_WORDPRESS_CONTAINER_NAME=jarch-blog-wordpress-ui

export ECR_REPO=193862077204.dkr.ecr.us-east-1.amazonaws.com/jarch

export JARCH_WEB_STATIC_IMAGE_NAME_LOCAL=$JARCH_WEB_STATIC_NAMESPACE/$JARCH_WEB_STATIC_IMAGE_NAME
export JARCH_WEB_STATIC_IMAGE_NAME_REPO=$JARCH_WEB_STATIC_NAMESPACE/$JARCH_WEB_STATIC_IMAGE_NAME
#commenting out the old repo name since we're now pulling from docker hub.  Keeping it so we can switch back when we get a local repo set up.
#export JARCH_WEB_STATIC_IMAGE_NAME_REPO=$ECR_REPO:$JARCH_WEB_STATIC_IMAGE_NAME

export JARCH_BLOG_WORDPRESS_IMAGE_NAME_LOCAL=$JARCH_BLOG_WORDPRESS_NAMESPACE/$JARCH_BLOG_WORDPRESS_IMAGE_NAME
export JARCH_BLOG_WORDPRESS_IMAGE_NAME_REPO=$JARCH_BLOG_WORDPRESS_NAMESPACE/$JARCH_BLOG_WORDPRESS_IMAGE_NAME
#commenting out the old repo name since we're now pulling from docker hub.  Keeping it so we can switch back when we get a local repo set up.
#export JARCH_BLOG_WORDPRESS_IMAGE_NAME_REPO=$ECR_REPO:$JARCH_BLOG_WORDPRESS_IMAGE_NAME
