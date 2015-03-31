FROM ubuntu:14.04

RUN apt-get update

# Install apache
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y \
            python-pip \
            python-dev \
            && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
                                                                            

# Install tiddlyweb
#RUN pip install -U pip
RUN pip install -U setuptools
RUN pip install -U tiddlywebwiki


RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y \
            curl \
            && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Setup wiki volume
VOLUME /www
VOLUME /var/log/apache2
VOLUME /etc/apache2
WORKDIR /www

CMD ["/bin/bash", "-c", "source /etc/apache2/envvars; apache2 -D FOREGROUND" ]

EXPOSE 80
