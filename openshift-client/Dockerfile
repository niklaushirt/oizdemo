FROM frolvlad/alpine-glibc:latest

MAINTAINER "Niklaus Hirt" <niklaushirt@gmail.com>

# install the oc client tools
COPY openshift-client-linux.tar.gz .
RUN tar -xzvf openshift-client-linux.tar.gz
RUN  ls
RUN mv oc /usr/local/bin/
RUN rm -rf openshift-client-linux.tar.gz

EXPOSE 8001