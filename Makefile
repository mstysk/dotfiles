DOTFILEPATH = ${HOME}/dotfiles
TASK_VERSION = 2.8.0
CHEAT_VERSION = 3.7.1
PACKAGE_DIR = ${HOME}/packages
SITE_FUNCTION = /usr/local/share/zsh/site-functions
RUNTIME_PATH = ${HOME}/.vim/autoload
LOCAL_BIN = /usr/local/bin
CONTRIB_PATH = /usr/local/share/git-core/contrib
DATA_DIR = ~/.data


default:
	@echo 'usage make target'

setup: vimrc task
	@echo 'setup done.'

.PHONY: vimsetup
vimsetup: vimrc vim-plug lsp vista

.PHONY: vimrc
vimrc:
	ln -s ${DOTFILEPATH}/vimrc ${HOME}/.vimrc
	@echo 'vimrc setup done.'

.PHONY:
asdfrc:
	ln -s ${DOTFILEPATH}/asdfrc ${HOME}/.asdfrc
	@echo 'asdfrc setup done.'

.PHONY: git-config
git-config:
	ln -s ${DOTFILEPATH}/gitconfig ${HOME}/.gitconfig
	@echo 'git config setup done.'

.PHONY: lsp
lsp: lsp-php
	@echo 'lsp setup done.'

.PHONY: lsp-php
lsp-php:
	npm i intelephense -g
	@echo 'lsp php setup done.'

.PHONY: task
task: task-package task-install task-completion
	@echo 'task done.'

.PHONY: task-package
task-package:
	curl -L -o ${PACKAGE_DIR}/task-${TASK_VERSION}.zip https://github.com/go-task/task/archive/v${TASK_VERSION}.zip
	unzip ${PACKAGE_DIR}/task-${TASK_VERSION}.zip
	@echo 'task package done.'

.PHONY: task-install
task-install:
	sh ${PACKAGE_DIR}/task-${TASK_VERSION}/install-task.sh
	@echo 'task install done.'

.PHONY: task-completion
task-completion:
	$( \
		if (realpath ${SITE_FUNCTION}/_task), \
		ls ${SITE_FUNCTION}/_task, \
		ln -s ${PACKAGE_DIR}/task-{$VERSION}/completion/zsh/_task ${SITE_FUNCTION}/_task \
	)
	@echo 'task completion done.'

.PHONY: vim-plug
vim-plug:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@echo 'vim-plug install done.'

.PHONY: vista
vista:
	mkdir -p ~/.vim/pack/git-plugins/start
	git clone https://github.com/liuchengxu/vista.vim.git --depth=1 ~/.vim/pack/git-plugins/start/vista.vim
	@echo 'vista install done.'

.PHONY: gtran
gtran:
	$( \
		if ($(shell which gtran)) \
		which gtran \
		cd ${PACKAGE_DIR} && git clone https://github.com/skanehira/gtran.git && cd gtran && go install \
	)
	@echo 'gtran install done.'

.PHONY: tabnine
tabnine:
	cd ${RUNTIME_PATH}
	git clone --depth 1 https://github.com/zxqfl/tabnine-vim
	@echo 'tabnine install done.'

.PHONY: zshrc
zshrc:
	ln -s ${DOTFILEPATH}/zshrc ${HOME}/.zshrc
	@echo 'zshrc setup done.'

.PHONY: doctoc
doctoc:
	npm install -g doctoc
	@echo 'doctoc install done.'

.PHONY: diff-highlight
diff-highlight:
	ln -s ${CONTRIB_PATH}/diff-highlight/diff-highlight ${LOCAL_BIN}/diff-highlight
	@echo diff-highlight install done.

.PHONY: git-new-workdir
git-new-workdir:
	ln -s ${CONTRIB_PATH}/workdir/git-new-workdir ${LOCAL_BIN}/git-new-work-dir
	@echo git work dir install done.
	
.PHONY: bat
bat:
	brew install bat
	@echo install bat done.

.PHONY: emojify
emojify:
	brew install emojify
	@echo emojify install done.

.PHONY: asdf
asdf:
	brew install asdf
	# dependencies
	brew install \
	coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc unzip curl bison re2c openssl icu4c libiconv zlib
	@echo asdf install done.

.PHONY: php-stan
php-stan:
	composer global require nette/neon phpstan/phpstan mglaman/drupal-check
	@echo phpstan intaslled.

.PHONY: tldr
tldr:
	npm install -g tldr
	@echo tldr installed.

.PHONY: ack
ack:
	brew install ack
	@echo ack installed.

.PHONY: cheat
cheat:
	rm -rf ${PACKAGE_DIR}/cheat-* ${LOCAL_BIN}/cheat
	curl -L -o ${PACKAGE_DIR}/cheat-${CHEAT_VERSION}.gz https://github.com/cheat/cheat/releases/download/${CHEAT_VERSION}/cheat-darwin-amd64.gz
	yes | gunzip ${PACKAGE_DIR}/cheat-${CHEAT_VERSION}.gz
	chmod 755 ${PACKAGE_DIR}/cheat-${CHEAT_VERSION}
	mv ${PACKAGE_DIR}/cheat-${CHEAT_VERSION} ${LOCAL_BIN}/cheat

.PHONY:cica-font
cica-font:
	rm -rf ${PACKAGE_DIR}/Cica
	git clone --depth 1 https://github.com/miiton/Cica.git ${PACKAGE_DIR}/Cica
	cd ${PACKAGE_DIR}/Cica &&  docker-compose build && docker-compose run --rm cica
	mv ${PACKAGE_DIR}/Cica/dist ~/Library/Fonts/Cica/
	rm -rf ${PACKAGE_DIR}/Cica

.PHONY: nextword-data
nextword-data: #https://github.com/high-moctane/nextword-data/releases
	curl -L -o ${PACKAGE_DIR}/nextword.tar.gz https://github.com/high-moctane/nextword-data/archive/small.tar.gz
	cd ${PACKAGE_DIR} && tar zxf nextword.tar.gz
	mv ${PACKAGE_DIR}/nextword-data-small ${DATA_DIR}/nextword-data

.PHONY: nextword
nextword:
	go get -u github.com/high-moctane/nextword


.PHONY: sqls
sqls:
	go get github.com/lighttiger2505/sqls
