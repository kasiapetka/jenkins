FROM --platform=linux/amd64 centos:7

RUN yum install openssh-server -y

RUN useradd remote_user && \
    echo "1234" | passwd remote_user  --stdin && \ 
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY ./remote-ki.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ &&\
    chmod 600 /home/remote_user/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen

RUN yum -y install mysql

RUN yum install python3 -y

RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc

RUN sh -c 'echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'

RUN yum install azure-cli -y

CMD /usr/sbin/sshd -D
