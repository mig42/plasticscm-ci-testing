FROM atlassian/bamboo-server

USER root

RUN apt-get update && apt-get install -y curl apt-transport-https gnupg
RUN echo "deb https://www.plasticscm.com/plasticrepo/stable/ubuntu/ ./" | \
    tee /etc/apt/sources.list.d/plasticscm-stable.list && \
    curl https://www.plasticscm.com/plasticrepo/stable/ubuntu/Release.key -L | \
    apt-key add -
RUN apt-get update && apt-get install -y plasticscm-client-core

VOLUME [ "${BAMBOO_USER_HOME}/.plastic4" ]
VOLUME [ "${BAMBOO_USER_HOME}/plugins"]

COPY plugins-entrypoint.sh /plugins-entrypoint.sh
RUN chown ${BAMBOO_USER}:${BAMBOO_GROUP} /plugins-entrypoint.sh
RUN chmod +x /plugins-entrypoint.sh

USER ${BAMBOO_USER}

ENTRYPOINT [ "/plugins-entrypoint.sh" ]
