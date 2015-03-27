FROM ubuntu:14.04.1
MAINTAINER Jorge Obiols <jorge.obiols@gmail.com>

RUN apt-get update && apt-get install -y postgresql-client

VOLUME ["/backup","/database"]
