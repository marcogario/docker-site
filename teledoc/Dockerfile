#
# A simple image with an SSH server
#  - Listens at :22
#  - Disabled password authentication

FROM debian:latest

# Install SSH
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install openssh-server -y && \
    apt-get install wget curl  -y && \    
    apt-get clean

RUN mkdir /var/run/sshd 
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config
RUN echo "GatewayPorts yes" >> /etc/ssh/sshd_config

EXPOSE 22
EXPOSE 5001

CMD ["/usr/sbin/sshd", "-D"]


# Create TELEDOC user
#RUN adduser --system --shell /usr/bin/false teledoc
RUN adduser teledoc

USER teledoc

# Create .ssh authorized_keys
RUN mkdir /home/teledoc/.ssh
RUN touch /home/teledoc/.ssh/authorized_keys
RUN chmod 600 /home/teledoc/.ssh/authorized_keys
RUN chmod 700 /home/teledoc/.ssh

# Copy SSH-key:
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvh2g0SCWYXjne0yCYnQvWDVUvNxlWhdSIXx9x8VVSe9B1LQsHFzmlFibp9b3cmXItF13mpE34WrpSwN0l7vzcIy8hbpBIrQ/+8EvnS8zwX3oALhatUyZvEOAW6rRpI2z8/Lk70K7shxjW+kZk45U+qq7m7vIUKB89shWchrLVq3Tppm55SivYZcLqcQnJ8d4qL2flR1650HNzz44TpGRoay/j2K3dquMJTV9UkjS8wgVHthfkxrhy0q3yf52fDI8y1cpChiYjOFKA/Qtxxma7DrkqCnS813zA1a70Ny6VSqp6bnJqI714qXc6fci7rF6DyPT/HKRHgSV5ELTiwWi5w== "  >> /home/teledoc/.ssh/authorized_keys

USER root


