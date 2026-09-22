# our base image
FROM node:14

# specify the port number the container should expose
EXPOSE 3001

# User user as root
USER root

# Create App
RUN mkdir /app

# Update Linux Packages
# Debian Buster reached EOL and was removed from the regular mirrors,
# so we point apt at the Debian archive instead.
RUN sed -i 's|http://deb.debian.org|http://archive.debian.org|g; s|http://security.debian.org|http://archive.debian.org|g' /etc/apt/sources.list \
    && sed -i '/buster-updates/d' /etc/apt/sources.list \
    && apt-get update && apt-get upgrade -y
RUN apt-get install -y default-mysql-client

# Run update and Strongloop install
# Node 14 ships with a compatible npm already; installing "npm@latest" pulls a
# version that requires Node 22+, so we pin to a version that still supports Node 14.
RUN npm install -g npm@6
RUN npm install -g pm2
RUN pm2 install pm2-logrotate
