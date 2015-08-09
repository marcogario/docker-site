#
# Git SSH server
#
#  This provides a git repo, accessible via ssh. 
#
#    - Provides default ssh pub key for login
#    - Repo is stored in the /git volume ( $GIT_REPO )
#    - TODO: Provides git-shell
#
FROM debian-ssh:latest

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get upgrade -y && \
    apt-get install git-sh git sharutils -y && \
    apt-get clean

# Create GIT user
#RUN adduser --system --shell /usr/bin/git-shell git
RUN adduser git

USER git

# Create .ssh authorized_keys
RUN mkdir /home/git/.ssh
RUN touch /home/git/.ssh/authorized_keys
RUN chmod 600 /home/git/.ssh/authorized_keys
RUN chmod 700 /home/git/.ssh

# Copy SSH-key:
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDe7T0TiZwXlQ/Ik5XMtjX3AtGXZH8Acmh/nyBcV5xAymHAILe8rUClDptq++i9a/V1i7dG19Hvzs8ZMMDalrWtKBkH0CFmngmohfUFpRDOVBIVGgOmuW/1lueQ+B3+X405WEqEUkGfP1nTxcgKrXjEajjNoUQKiGb9ffngSEFndQxzmBNYwAma9XA/JEUS9odLW8NIA7Ik3v8Im/TzlY1sFQYk6XGQ25b2soOcTfazFfOcI+6xMjCLKq+83ElPL+LjnmzzsBzHWJ8wbC/dOwhES0Gqcli6XUQDACCtNQDno+ics/DJRWQp3lvhx8jMSuqRB0zyKOIsi811fLMZfp2N" \
  >> /home/git/.ssh/authorized_keys


# TODO: Configure git-shell
# RUN chmod +x /home/git/git-shell-commands/help
# RUN chmod +x /home/git/git-shell-commands/list

# Configure GIT user
ENV GIT_USER="marco"
ENV GIT_EMAIL="marco.gario@gmail.com"
RUN git config --global user.email $GIT_EMAIL
RUN git config --global user.name $GIT_USER
RUN git config --global push.default simple


USER root

# Store all repos in ~/repos/
ENV GIT_REPO="/git"
VOLUME ["/git"]
