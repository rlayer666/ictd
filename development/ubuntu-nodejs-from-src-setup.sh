#!/bin/bash
#

function sys_init
{

rm -f .bash_aliases
touch .bash_aliases

cat << QUERY > .bash_aliases
export PATH=$HOME/container/bin:$HOME/bin:$PATH

alias dir="ls -alALF"
alias update="sudo apt update && sudo apt dist-upgrade && sudo apt autoclean && sudo apt autoremove"
alias reboot="sudo reboot"
QUERY

}

function sys_update
{

sudo apt update && sudo apt dist-upgrade && sudo apt autoclean && sudo apt autoremove && sudo reboot

}

function dev_prereq
{

 sudo apt install python make gcc g++ xz-utils

}

function node_init
{

mkdir -p $HOME/src $HOME/container && cd $HOME/src && git clone https://github.com/nodejs/node && cd node

git checkout v8.x && ./configure --prefix=$HOME/container && make -j 2 release-only all

make install

rsync -arv deps/npm/man $HOME/container/share/

npm install -g node-gyp

}

# sys_init
# sys_update
# dev_prereq
# node_init

exit

