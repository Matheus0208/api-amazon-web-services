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
RUN sed -i 's/deb.debian.org/archive.debian.org/g; s|security.debian.org|archive.debian.org/debian-security|g' /etc/apt/sources.list \
    && sed -i '/buster-updates/d' /etc/apt/sources.list \
    && apt-get update && apt-get upgrade -y
RUN apt-get install mysql-client -y

# Run update and Strongloop install
RUN npm install -g npm
RUN npm install -g pm2
RUN pm2 install pm2-logrotate