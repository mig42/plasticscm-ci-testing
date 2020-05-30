#!/bin/bash

cp ${BAMBOO_USER_HOME}/plugins/*.jar ${BAMBOO_INSTALL_DIR}/atlassian-bamboo/WEB-INF/lib

exec /entrypoint.sh