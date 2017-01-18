# *********************************************************************************
# Description: provision a new docker host machine in AWS to be used for the wordpress blog
# Author:      Joe Rice
# Created:     10/14/2016
#
# Notes:
#    Script assumes that the following environment variables are set
#       export AWS_ACCESS_KEY=<Secret>
#       export AWS_SECRET_KEY=<Super_Top_Secret>
# *********************************************************************************

DIR="$(cd "$(dirname "$0")" && pwd)"

source $DIR/jarch-setenv.sh

PLAYBOOK_FILE=./deploy-jra-app-web-static.yml
EC2_INVENTORY_FILE=$INFRA_MODULES_DOCKER_SWARM_ANSIBLE_DIR/ec2-inventory/ec2.py
PLAYBOOK_VAR_ENV=qa1
PLAYBOOK_VAR_DOMAIN_PREFIX="qa1."

cd $JARCH_DEPLOYMENT_ANSIBLE_DIR

cp $INFRA_MODULES_DOCKER_SWARM_ANSIBLE_DIR/ansible.cfg .

echo cd $JARCH_DEPLOYMENT_ANSIBLE_DIR
echo ansible-playbook -i $EC2_INVENTORY_FILE -v -u ubuntu -e env=$PLAYBOOK_VAR_ENV -e env_domain_prefix=$PLAYBOOK_VAR_DOMAIN_PREFIX --private-key $JRA_BUILD_PRIVATE_KEY_FILE $PLAYBOOK_FILE

rm ./ansible.cfg