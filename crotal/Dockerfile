#
# Simple Crotal-based website service
#
#  This provides a git repo, accessible via ssh. A post-commit hook
#  runs the building of the site.
#
#  - The published website is in the volume /www/ ($WWW_DIR)
#  - The git repo is in /git/ ($GIT_REPO)
#  - SSH-server listens on port 22
#

FROM debian-git-ssh:latest

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get upgrade -y && \
    apt-get install python-pip sudo -y && \
    apt-get clean

# Install Crotal Static Website Generator service
RUN pip install crotal

# This is the hook to deploy the website
ADD post-receive /home/git/crotal-post-receive

ADD run_crotal.sh /
RUN chmod +x run_crotal.sh

# Publicly accessible data
ENV WWW_DIR=/www/
VOLUME ["/www/"]     

