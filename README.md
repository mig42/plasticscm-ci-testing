# Plastic SCM - CI testing

This repository contains docker-compose projects we use to develop and test our
CI plugins.

These environment are work in progress, as we expand them when we have the need.

They might seem too basic or rough, but that's because they're only intended
for testing environments! Please don't use them in your production environments.
However, they might be useful to build your Docker images if you're interested
in using Plastic SCM in your dockerized CI setup.

## Bamboo

This environment provisions one Bamboo server and one Bamboo agent, both with
`cm` installed. The HTTP server will listen in port `8085`.

Make sure you provide a valid `client.conf` in `bamboo/client/config`! The agent
and the server will use it to run the Plastic SCM Shell. You need to use the
appropriate server name or IP.

The server will start with the default Plastic SCM plugin, copied from the
distributed package. However, we need to upload development version of the
plugin. It's a version 1 plugin, so we need to copy the JAR file in the
`atlassian-bamboo/WEB-INF/lib` directory before the server starts. Simply place
your custom plugin build in the `server/plugins` directory and Docker will
do the rest.

Bamboo will save its _home_ contents in `server/home`. All Bamboo data will
appear there, so you can start up any new container -even with newer images- at
any moment. All your Bamboo configurations will be there.

When you're all set up, run `docker-compose up` in the `bamboo` directory.

## Jenkins

This environment provisions one Jenkins server and one Jenkins slave, both with
`cm` installed. The HTTP server will listen in port `8080`.

Make sure you provide a valid `client.conf` for the server and the slave.
The server `client.conf` needs to be in `jenkins/server/home/.plastic4`, whereas
the slave one needs to be in `jenkins/slave/client-config`.

This difference comes from how the Jenkins server is set up: the `$HOME`
directory of the `jenkins` user is the `JENKINS_HOME` as well, so we need
to place our `.plastic4` directory there.

Keep in mind that you need to use the appropriate server name or IP in both
`client.conf` files.

The server will start with the latest Plastic SCM plugin version installed.
We don't currently have a way to start the Jenkins server with a custom plugin
installed, but you can always install a new plugin using the web interface.
The Jenkins server is able to restart to load the new installed plugins.

As we mentioned, Jenkins will save its _home_ contents in `server/home`. All
Jenkins data (logs, build results, artifacts, etc.) will appear there, so you
can start up any new container -even with newer images- at any moment.
Everything will be still there.

Remember to write someting in `jenkins/slave/secret.txt`. At first you won't
know what should go there, just ensure the file exists. You need to wait until
the server is set up, and then go to *Manage Jenkins > Manage Nodes and Clouds*.

Register there a new node. Be sure to name it as defined in
`jenkins/docker-compose.yml`! Once registered, the node page will show you the
secret token you need to write in `jenkins/slave/secret.txt`.

When you're all set up, run `docker-compose up` in the `jenkins` directory.

### Points of improvement

1. The Jenkins slave needs to be registered manually
2. The Jenkins slave needs to wait until the Jenkins server is able to receive
   connections
