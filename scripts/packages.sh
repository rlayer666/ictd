#!/bin/sh
#

PACKAGES="g++ make openjdk-7-jdk unixodbc-dev libssl-dev \
          libncurses5-dev xsltproc fop libxml2-utils libpam0g-dev"

sudo apt-get install ${PACKAGES}

exit

