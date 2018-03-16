#!/bin/bash
#

## NOTE:  We do not use the git based url, just the project url ...
##
## https://infogroupdpservices.visualstudio.com
## 2werjgxq3e23lpuwd67zi7yqjeotvoxbush7u2ybwmpgnuqxakha

function system_init
{

echo "edit /etc/gai.conf and uncomment line 54"

sudo vi /etc/gai.conf

echo "add our aliases to .bash_aliases"

rm -f .bash_aliases
touch .bash_aliases

echo "alias dir=\"ls -alALF\"" >> .bash_aliases
echo "alias reboot=\"sudo reboot\"" >> .bash_aliases
echo "alias update=\"sudo apt update && sudo apt dist-upgrade && sudo apt autoremove\"" >> .bash_aliases

source .bash_aliases

sudo apt update && sudo apt dist-upgrade && sudo apt autoremove && sudo reboot

}

function build_init
{

  sudo apt install make autoconf g++ gcc                      # in general
  sudo apt install libz-dev gettext libcurl4-openssl-dev      # for git
  sudo apt install libxml2-utils libxml2-dev doxygen graphviz # for docs
  sudo apt install unzip flex bison libssl-dev                # for gsoap
  sudo apt autoremove

}

function git_init
{

  mkdir -p $HOME/src && cd $HOME/src

  git clone https://github.com/git/git

  cd git

  make configure

  ./configure --prefix=/usr

  make all && sudo make install

}

function vsts_init
{

  mkdir -p $HOME/src && cd $HOME/src

  scp royl@papdpsbldd02:vsts-agent-linux-x64-2.127.0.tar.gz .

  mkdir -p vsts-agent && cd vsts-agent && tar xvzf ../vsts-agent-linux-x64-2.127.0.tar.gz

  sudo ./bin/installdependencies.sh

  head -5 ~/ubuntu-vsts.config.sh

  ./config.sh

}

function dpservices_pull
{

  mkdir -p $HOME/src && cd $HOME/src

  git clone --verbose https://infogroupdpservices.visualstudio.com/_git/dpservices

  git checkout -b RoysUbuntuPatches

}

function dpservices_metadata_build
{

  cd $HOME/src/dpservices/Metadata

  rm -f $HOME/Metadata.build.log
  touch $HOME/Metadata.build.log

  make clean all test docs 2>&1 | tee --append $HOME/Metadata.build.log

  vi $HOME/Metadata.build.log

}

function dpservices_iusamatch_build
{

  cd $HOME/src/dpservices/iusaMatch

  rm -f $HOME/iusaMatch.build.log
  touch $HOME/iusaMatch.build.log

  make thirdparty-clean thirdparty clean deps 2>&1 | tee --append $HOME/iusaMatch.build.log
  make all artifacts docs                     2>&1 | tee --append $HOME/iusaMatch.build.log
  make test                                   2>&1 | tee --append $HOME/iusaMatch.build.log

  vi $HOME/iusaMatch.build.log

}

function dpservices_enhancedbfp_build
{

  cd $HOME/src/dpservices/enhancedBFP

  rm -f $HOME/enhancedBFP.build.log
  touch $HOME/enhancedBFP.build.log

  make clean all 2>&1 | tee --append $HOME/enhancedBFP.build.log

  vi $HOME/enhancedBFP.build.log

}

function dpservices_bfp2xml_build
{

  cd $HOME/src/dpservices/bfp2xml/server

  rm -f $HOME/bfp2xml.build.log
  touch $HOME/bfp2xml.build.log

  make clean all 2>&1 | tee --append $HOME/bfp2xml.build.log

  vi $HOME/bfp2xml.build.log

}

function dpservices_pander_build
{

  cd $HOME/src/dpservices/Pander

  rm -f $HOME/Pander.build.log
  touch $HOME/Pander.build.log

  make clean all 2>&1 | tee --append $HOME/Pander.build.log

  vi $HOME/Pander.build.log

}

# system_init
# build_init
git_init
# vsts_init
# dpservices_pull
# dpservices_metadata_build
# dpservices_iusamatch_build
# dpservices_enhancedbfp_build
# dpservices_bfp2xml_build
# dpservices_pander_build

exit

