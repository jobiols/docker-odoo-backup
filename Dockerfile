FROM ubuntu:14.04.1
MAINTAINER Jorge Obiols <jorge.obiols@gmail.com>

RUN apt-get update && apt-get install -y postgresql-client

ADD backup /usr/bin/jamo-backup
ADD restore /usr/bin/jamo-restore
RUN chmod a+x /usr/bin/backup
RUN chmod a+x /usr/bin/restore

VOLUME ["/backup","/database"]
