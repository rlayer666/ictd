#!/bin/sh
#

#sudo apt-get install riak riak-cs riak-cs-control stanchion
#sudo apt-get update
#sudo apt-get dist-upgrade
#sudo apt-get autoremove

sudo cp -i /etc/riak/base.app.config /etc/riak/app.config
sudo cp -i /etc/riak/base.vm.args    /etc/riak/vm.args

exit

sudo cp -i /etc/riak/app.config /etc/riak/base.app.config
sudo cp -i /etc/riak/vm.args    /etc/riak/base.vm.args

sudo cp -i riak.app.config /etc/riak/app.config
sudo cp -i riak.vm.args    /etc/riak/vm.args

# sudo riak chkconfig && ( sudo riak restart || sudo riak start ) && sudo riak ping

exit

sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get autoremove

sudo mv -i /etc/riak/app.config /etc/riak/base.app.config
sudo mv -i /etc/riak/vm.args    /etc/riak/base.vm.args


exit

