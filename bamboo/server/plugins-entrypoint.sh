#!/bin/bash

if [ -f ${BAMBOO_USER_HOME}/plugins/bamboo-plasticscm-plugin-*.jar ]; then
  cp ${BAMBOO_USER_HOME}/plugins/bamboo-plasticscm-plugin*.jar ${BAMBOO_INSTALL_DIR}/atlassian-bamboo/WEB-INF/lib
fi

exec /entrypoint.sh