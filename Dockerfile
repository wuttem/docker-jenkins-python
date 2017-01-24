FROM mths/docker-pmdrr

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y git

# Install SSH
RUN apt-get install -y openssh-server
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd

# Add user jenkins to the image
RUN adduser --quiet jenkins
# Set password for the jenkins user
RUN echo "jenkins:jenkins" | chpasswd

RUN apt-get install -y maven
# Standard SSH port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]