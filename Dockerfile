FROM phusion/baseimage:0.9.22
MAINTAINER Zhan.Shi <g.shizhan.g@gmail.com>

RUN echo "deb http://dl.openfoam.org/ubuntu xenial main" >> /etc/apt/sources.list.d/openfoam.list && \
    curl http://dl.openfoam.org/gpg.key | apt-key add -

RUN apt-get update && apt-get -yq install openfoam5 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "source /opt/openfoam5/etc/bashrc" >> /root/.bashrc

VOLUME ["/cases"]
WORKDIR /cases

CMD ["/sbin/init"]