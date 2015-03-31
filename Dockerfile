FROM ubuntu:14.04

RUN apt-get update

# Install apache
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y \
            apache2 python-pip \
            python-dev \
            apache2 libapache2-mod-wsgi && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
                                                                            

# Install tiddlyweb
RUN pip install -U pip
RUN pip install -U tiddlywebwiki

# Setup wiki volume
VOLUME /www
VOLUME /var/log/apache2
VOLUME /etc/apache2
WORKDIR /www

CMD ["/bin/bash", "-c", "source /etc/apache2/envvars; apache2 -D FOREGROUND" ]

EXPOSE 80
