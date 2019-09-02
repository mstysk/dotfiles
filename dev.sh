#!/bin/bash

# font instal
nerd_fonts() {
  git clone --branch=master --depth 1 https://github.com/ryanoasis/nerd-fonts.git
  cd nerd-fonts
  ./install.sh $1  # "Source" to install Sauce Code Nerd Font
  cd ..
  rm -rf nerd-fonts
}

metals() {
  curl -L -o coursier https://git.io/coursier
  chmod +x coursier
  ./coursier bootstrap \
    --java-opt -Xss4m \
    --java-opt -Xms100m \
    --java-opt -Dmetals.client=coc.nvim \
    org.scalameta:metals_2.12:0.7.0 \
    -r bintray:scalacenter/releases \
    -r sonatype:snapshots \
    -o /usr/local/bin/metals-vim -f
  makedir $HOME/bin
  mv coursier $HOME/bin
}

makedir() {
  dir=$1
  if [ ! -d $dir ]; then
      mkdir -p $dir
  fi
}
