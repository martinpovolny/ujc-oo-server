FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    ln -fs /usr/share/zoneinfo/Europe/Prague /etc/localtime && \
	apt-get install -y tzdata && \
 	dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get install -y tightvncserver libreoffice && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /rpc_server/
ADD rpc_server /rpc_server/
RUN chown -R nobody /rpc_server

USER nobody
ENV HOME /rpc_server/
ENV USER nobody
WORKDIR /rpc_server/

ENTRYPOINT /rpc_server/entrypoint.sh
#ENTRYPOINT /bin/sh
EXPOSE 1210
EXPOSE 5901
EXPOSE 2002
