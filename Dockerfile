FROM ubuntu:14.04

# Install python dependancies
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

# Setup wiki volume
VOLUME /wiki
WORKDIR /wiki

# Default parameters
ENV INSTANCE=default
ENV SERVER_NAME=0.0.0.0
ENV SERVER_PORT=80

# launch the stuff
COPY entrypoint.sh /root/entrypoint.sh
CMD ["/bin/bash", "-c", "/root/entrypoint.sh" ]

EXPOSE 80
