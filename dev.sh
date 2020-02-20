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

lsp-docker() {
  which docker-langserver
  if [ $? != 0 ]; then
    npm install -g dockerfile-language-server-nodejs
  fi
}

prompt-instll() {
  npm install --global pure-prompt pure-prompt-now
}

lsp-php-server() {
  npm i intelephense -g
}

task-completion() {
  VERSION=2.8.0
  SITE_FUNCTION=/usr/local/share/zsh/site-functions
  if [ -f ${SITE_FUNCTION}/_task ]; then
    echo 'task completion is already installed.'
    return;
  fi

  CURRENT_DIR=${PWD}
  PACKAGE_DIR="${HOME}/packages"
  makedir ${PACKAGE_DIR}
  cd ${PACKAGE_DIR}
  if [ ! -d task-${VERSION} ]; then
    curl -L -o task-${VERSION}.zip https://github.com/go-task/task/archive/v${VERSION}.zip
    unzip task-${VERSION}.zip
  fi
  cd /usr/local/share/zsh/site-functions
  ln -s ${PACKAGE_DIR}/task-${VERSION}/completion/zsh/_task _task
  echo 'task completion installed.'
  cd ${CURRENT_DIR}
}

lsp-efm() {
  go get github.com/mattn/efm-langserver
  npm install -g markdownlint-cli
}
