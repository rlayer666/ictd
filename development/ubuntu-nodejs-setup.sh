#!/bin/bash
#

function sys_init
{

rm -f .bash_aliases
touch .bash_aliases

cat << QUERY > .bash_aliases
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

mkdir -p $HOME/src && cd $HOME/src

wget -qO- https://deb.nodesource.com/setup_8.x | sudo -E bash -

sudo apt install nodejs build-essential node-gyp

}

# sys_init
# sys_update
# dev_prereq
node_init

exit
