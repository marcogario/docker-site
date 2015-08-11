#!/bin/bash
#
# Requires two env vars: GIT_REPO, WWW_DIR

chown git:git /git
chown git:git /www

if [ -e $GIT_REPO/HEAD ]
then
    # Repo exists: force a build and run server
    #echo "$GIT_REPO found"
    if [ ! -e /home/git/pelican-site-tmp ]
    then
	cd /home/git/
	sudo -u git git clone $GIT_REPO pelican-site-tmp
	cd pelican-site-tmp
    else
	cd /home/git/pelican-site-tmp
	git pull
	git checkout -f
    fi
    sudo -u git pelican content
    sudo -u git rm -Rf $WWW_DIR/*
    cp -av /home/git/pelican-site-tmp/output/* $WWW_DIR//

else
    # Initialize the repo
    mkdir $GIT_REPO
    chown git:git $GIT_REPO
    cd $GIT_REPO
    sudo -u git git init --bare
    sudo -u git cp /home/git/pelican-post-receive hooks/post-receive
    sudo -u git chmod +x hooks/post-receive

    # Initialize the website
    cd /home/git/
    sudo -u git git clone $GIT_REPO pelican-site-tmp
    cd pelican-site-tmp
    #sudo -u git pelican-quickstart .
    #sudo -u git git add *
    sudo -u git git commit -m "Initialized site." --allow-empty
    sudo -u git git push
    
fi
