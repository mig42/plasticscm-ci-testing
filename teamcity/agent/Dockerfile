FROM jetbrains/teamcity-minimal-agent

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

RUN ln -s /home/buildagent/.plastic4/cm.log.conf /opt/plasticscm5/client/cm.log.conf

VOLUME [ "/home/buildagent/.plastic4" ]

ENTRYPOINT [ "dockerize" ]

USER buildagent