#!/bin/sh
#

mkdir -p $HOME/src
cd       $HOME/src

wget http://erlang.org/download/otp_src_R16B03.tar.gz
tar xvzf otp_src_R16B03.tar.gz
cd otp_src_R16B03/
./configure
make 
sudo make install

exit

erl
q().

