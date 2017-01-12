
# *********************************************************************************
# Description: Builds a docker image for this node app
# Author:      Joe Rice
# Created:     10/14/2016
#
# Notes:
#    Uses the Dockerfile in this same git repo
# *********************************************************************************

DIR="$(cd "$(dirname "$0")" && pwd)"
COMMIT_COMMENT=$1

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
echo .
echo    Command used:  git add -A .
echo ----------------------------------------------
git add -A .
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
echo .
echo    Command used:  git commit -m $COMMIT_COMMENT
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