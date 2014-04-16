#!/bin/sh
#

sudo apt-get purge stanchion riak-cs-control riak-cs riak
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get autoremove

exit

