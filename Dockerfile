FROM ubuntu:14.04

RUN apt-get update

# Install apache
RUN apt-get update && \
    apt-get install -q -y apache2 python-pip \
            python-dev \
            apache2 libapache2-mod-wsgi && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
                                                                            

# Install tiddlyweb
RUN pip install -U pip
RUN pip install -U tiddlywebwiki

# Setup wiki volume
VOLUME /var/lib/tiddlywiki
WORKDIR /var/lib/tiddlywiki

# Add init-and-run script
#ADD init-and-run-wiki /usr/local/bin/init-and-run-wiki

# Meta
#CMD ["/usr/local/bin/init-and-run-wiki"]
#EXPOSE 8080
