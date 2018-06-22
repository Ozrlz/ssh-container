FROM ubuntu:16.04

ARG ENV_PASSWD

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

EXPOSE 22

ADD ./create_users.sh /mnt/create_users.sh
RUN /bin/bash /mnt/create_users.sh
CMD ["/usr/sbin/sshd", "-D"]
