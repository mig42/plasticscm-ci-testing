FROM jenkins/inbound-agent:4.9-1

USER root

RUN apt-get update && apt-get install -y curl apt-transport-https gnupg
RUN echo "deb https://www.plasticscm.com/plasticrepo/stable/ubuntu/ ./" | \
    tee /etc/apt/sources.list.d/plasticscm-stable.list && \
    curl https://www.plasticscm.com/plasticrepo/stable/ubuntu/Release.key -L | \
    apt-key add -
RUN apt-get update && apt-get install -y plasticscm-client-core

ENV DOCKERIZE_VERSION v0.6.1
RUN curl -OL https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

VOLUME [ "/home/jenkins/.plastic4" ]
# Old entrypoint: /usr/local/bin/jenkins-agent
ENTRYPOINT [ "dockerize" ]

USER jenkins