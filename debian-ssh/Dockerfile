#
# A simple image with an SSH server
#  - Listens at :22
#  - Disabled password authentication

FROM debian:latest

# Install SSH
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install openssh-server -y && \
    apt-get clean

RUN mkdir /var/run/sshd 
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
