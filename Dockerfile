FROM node:latest

RUN apt-get update && apt-get install -y build-essential apt-transport-https ca-certificates curl gnupg2 software-properties-common tar 

## Docker Compose
RUN curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

## Docker
RUN curl https://download.docker.com/linux/static/stable/x86_64/docker-17.09.0-ce.tgz > docker.tar.gz && tar xzvf docker.tar.gz -C /usr/local/bin/ --strip-components=1
RUN rm docker.tar.gz && docker -v

## PhantomJS
RUN curl -L https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 > phantomjs.tar.bz2 && tar xjvf phantomjs.tar.bz2 phantomjs-2.1.1-linux-x86_64/bin/phantomjs --strip-components=2 -C /usr/local/bin/
