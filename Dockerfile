FROM cburki/sshd:latest
MAINTAINER Christophe Burki, christophe.burki@gmail.com

# Install system requirements
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    nodejs \
    npm \
    python2.7 && \
    apt-get autoremove -y && \
    apt-get clean

# install setup scripts
COPY scripts/* /opt/
RUN chmod a+x /opt/setupafter.sh

EXPOSE 22

CMD ["/usr/bin/s6-svscan", "/etc/s6"]
