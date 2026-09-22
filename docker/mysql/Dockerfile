# our base image
FROM mysql:5.7.28

# specify the port number the container should expose
EXPOSE 3306

USER root

# Debian Stretch reached EOL and was removed from the regular mirrors, so we
# point apt at the Debian archive instead. The MySQL APT repo added by this
# base image also ships an expired signing key, so we drop that list file
# entirely (we don't need mysql.com packages, just apt-utils).
RUN rm -f /etc/apt/sources.list.d/mysql.list \
    && sed -i 's|http://deb.debian.org|http://archive.debian.org|g; s|http://security.debian.org|http://archive.debian.org|g' /etc/apt/sources.list \
    && sed -i '/stretch-updates/d' /etc/apt/sources.list \
    && apt-get update -y
RUN apt-get install -y apt-utils
