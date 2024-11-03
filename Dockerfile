FROM ubuntu:24.04
RUN apt-get update
RUN apt-get install -y software-properties-common ca-certificates
RUN echo 'deb http://repo.aptly.info/ squeeze main' >> /etc/apt/sources.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EE727D4449467F0E 
RUN apt-get update
RUN apt-get install -y aptly
RUN apt-get clean

ADD aptly.conf /etc/aptly.conf
RUN gpg --no-default-keyring --keyring trustedkeys.gpg --keyserver keyserver.ubuntu.com --recv-keys 871920D1991BC93C
VOLUME ["/aptly"]
