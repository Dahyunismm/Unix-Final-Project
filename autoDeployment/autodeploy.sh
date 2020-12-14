#!/usr/bin/sh

# Changing the directory
cd /home/debian/Unix-Final-Project
# Update the tracking branches in order to compare local and github
git fetch
UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

# Checks if the repository is up to date and if you need to pull it
if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date, No need to pull"
elif [ $LOCAL = $BASE ]; then
    echo "Repository not up-to-date, need to pull"
    # pull the latest repository from github
    git pull
    # Builds the website and transfers it to /var/www/html/
    cd /home/debian/Unix-Final-Project/agencyWebsite
    bundle exec jekyll build
    cp -fR /home/debian/Unix-Final-Project/agencyWebsite/_site /var/www/html/	
else
    echo "Nothing do here"
fi
