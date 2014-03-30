#!/bin/sh
#

cd $HOME/src/webmachine

vi rebar.config

exit

scripts/new_webmachine.sh csd ..
cd ../csd
make

echo "q()." | ./start.sh

exit

