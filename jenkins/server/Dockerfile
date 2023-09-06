FROM jenkins/jenkins:2.340-jdk11

USER root

RUN apt-get update && apt-get install -y curl apt-transport-https gnupg
RUN echo "deb https://www.plasticscm.com/plasticrepo/stable/ubuntu/ ./" | \
    tee /etc/apt/sources.list.d/plasticscm-stable.list && \
    curl https://www.plasticscm.com/plasticrepo/stable/ubuntu/Release.key -L | \
    apt-key add -
RUN apt-get update && apt-get install -y plasticscm-client-core

RUN /usr/local/bin/install-plugins.sh plasticscm-plugin

USER jenkins
