#!/bin/bash
#
# Requires two env vars: GIT_REPO, WWW_DIR

chown git:git /git
chown git:git /www

if [ -e $GIT_REPO/HEAD ]
then
    # Repo exists: force a build and run server
    #echo "$GIT_REPO found"
    cd /home/git/crotal-site-tmp
    git pull
    git checkout -f
    sudo -u git crotal generate

else
    # Initialize the repo
    mkdir $GIT_REPO
    chown git:git $GIT_REPO
    cd $GIT_REPO
    sudo -u git git init --bare
    sudo -u git cp /home/git/crotal-post-receive hooks/post-receive
    sudo -u git chmod +x hooks/post-receive

    # Initialize the website
    cd /home/git/
    sudo -u git git clone $GIT_REPO crotal-site-tmp
    cd crotal-site-tmp
    sudo -u git crotal init .
    sudo -u git git add *
    sudo -u git git commit -a -m "Initialized site: $WEBSITE_NAME"
    sudo -u git git push
    
fi
