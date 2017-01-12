# *********************************************************************************
# Description: Builds a docker image for this node app
# Author:      Joe Rice
# Created:     10/14/2016
#
# Notes:
#    Uses the Dockerfile in this same git repo
# *********************************************************************************

DIR="$(cd "$(dirname "$0")" && pwd)"
COMMIT_COMMENT="Commiting changes to wiki and doc pages"

source $DIR/jarch-setenv.sh

cd $JARCH_GIT_PROJECT_ROOT

echo --------------------------------------------------------------------------------
echo Status BEFORE git add
echo --------------------------------------------------------------------------------
git status
echo .
echo .
echo ----------------------------------------------
echo Adding wiki files...
echo ----------------------------------------------
git add -A wiki/*
echo .
echo .
echo --------------------------------------------------------------------------------
echo Status AFTER git add
echo --------------------------------------------------------------------------------
git status
echo .
echo .
echo ----------------------------------------------
echo committing wiki files...
echo ----------------------------------------------
git commit -m '$COMMIT_COMMENT'

echo .
echo .
echo --------------------------------------------------------------------------------
echo Status AFTER commit
echo --------------------------------------------------------------------------------
git status
echo .
echo .
echo ----------------------------------------------
echo pushing wiki files to git...
echo ----------------------------------------------
git push origin master
echo .
echo .
echo --------------------------------------------------------------------------------
echo Status AFTER pushing files to git repo.
echo --------------------------------------------------------------------------------
git status