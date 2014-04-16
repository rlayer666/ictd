#!/bin/sh
#

sudo apt-get purge erlang && \
sudo apt-get update       && \
sudo apt-get dist-upgrade && \
sudo apt-get autoremove

exit

