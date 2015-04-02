# tiddlyweb-docker

Docker container running tiddlyweb server for tiddlywiki

To test

       docker run -it --rm -p 80:80 gnibu/tiddlyweb:latest

Then use your browser at the address localhost

You can use an host folder (ie: /data/wiki) to be mounted in the container. This will ensure persistance of your data

    docker run -d  -e INSTANCE=mind -v /data/wiki:/wiki -p 80:80 gnibu/tiddlyweb:latest

You can specify parameter such as the instance name to run (if it doen't exist, it will be created)

    docker run -d  -e INSTANCE=mind -v /data/wiki:/wiki -p 80:80 gnibu/tiddlyweb:latest

Default parameters you can overide

        ENV INSTANCE=default
        ENV SERVER_NAME=0.0.0.0
        ENV SERVER_PORT=80
