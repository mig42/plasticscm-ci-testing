FROM jetbrains/teamcity-server

USER root

RUN apt-get update && apt-get install -y curl apt-transport-https gnupg
RUN echo "deb https://www.plasticscm.com/plasticrepo/stable/ubuntu/ ./" | \
    tee /etc/apt/sources.list.d/plasticscm-stable.list && \
    curl https://www.plasticscm.com/plasticrepo/stable/ubuntu/Release.key -L | \
    apt-key add -
RUN apt-get update && apt-get install -y plasticscm-client-core
RUN ln -s /opt/teamcity/.plastic4/cm.log.conf /opt/plasticscm5/client/cm.log.conf

VOLUME [ "/home/tcuser/.plastic4" ]

USER tcuser
