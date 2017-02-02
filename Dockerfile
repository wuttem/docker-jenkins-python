FROM mths/docker-pmdrr

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y git libpq-dev

# Install some more Python Stuff
RUN pip install pytest mock pytest-cov boto MySQL-python SQLAlchemy requests Flask Flask-SQLAlchemy

# Install SSH
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:jenkins' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
