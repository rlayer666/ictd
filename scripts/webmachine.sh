#!/bin/sh
#

mkdir -p $HOME/src
cd       $HOME/src

git clone git://github.com/basho/webmachine

cd webmachine
make

scripts/new_webmachine.sh csd ..
cd ../csd
make

echo "q()." | ./start.sh

exit

