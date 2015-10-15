FROM ubuntu:14.04.2
MAINTAINER Jorge Obiols <jorge.obiols@gmail.com>

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" >  /etc/apt/sources.list.d/pgdg.list
RUN apt-get update & apt-get install -y wget
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
RUN apt-get update && apt-get install -y postgresql-client-9.4

ADD backup /usr/bin/backup
ADD restore /usr/bin/restore
RUN chmod a+x /usr/bin/backup
RUN chmod a+x /usr/bin/restore

VOLUME ["/backup"]

