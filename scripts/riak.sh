#!/bin/sh
#

mkdir -p $HOME/src
cd       $HOME/src

git clone git://github.com/basho/riak

cd riak
make

make devrel
cd dev
dev1/bin/riak start
dev2/bin/riak start
dev3/bin/riak start
dev4/bin/riak start
dev2/bin/riak-admin cluster join dev1
dev3/bin/riak-admin cluster join dev1
dev4/bin/riak-admin cluster join dev1
dev1/bin/riak-admin cluster plan
dev1/bin/riak-admin cluster commit

exit

