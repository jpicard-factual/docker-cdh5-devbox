FROM factual/docker-cdh5-dev

RUN rm -f /etc/service/sshd/down
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
ADD sshd_config /etc/ssh/

RUN mkdir -p /share
RUN mkdir -p /local


RUN apt-get update
RUN apt-get install -y byobu

#cleanup
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/home","/share", "/local"]