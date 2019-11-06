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

install-firenvim() {
    CURRENT_DIR=${PWD}
    PACKAGE_DIR="${HOME}/packages"
    makedir ${PACKAGE_DIR}
    cd ${PACKAGE_DIR}
    git clone https://git.sr.ht/~glacambre/firenvim
    cd firenvim
    npm install
    npm run build
    npm run install_manifests

    echo '\nPlease setting chrome://extensions, enable Developer mode \n@see https://github.com/glacambre/firenvim#google-chromechromium-specific-steps \n'
    cd target/chrome
    echo "target/chrome directory is ${PWD}"
    cd ${CURRENT_DIR}
}
