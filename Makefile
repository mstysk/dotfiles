DOTFILEPATH = ${HOME}/dotfiles
TASK_VERSION = 2.8.0
PACKAGE_DIR = ${HOME}/packages
SITE_FUNCTION = /usr/local/share/zsh/site-functions

setup: vimrc task
	@echo 'setup done.'

.PHONY: vimrc
vimrc: .vimrc vim-plug lsp vista
	$( \
		if $(realpath ${MYVIMRC}), \
		ls ${VIMRC}, \
		ln -s ${DOTFILEPATH}/.vimrc ${MYVIMRC} \
	)
	@echo 'vimrc setup done.'

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

.PHONY: prompt
prompt:
	npm install --global pure-prompt pure-prompt-now
	@echo 'prompt install done.'

.PHONY: vim-plug
vim-plug:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@echo 'vim-plug install done.'

.PHONY: vista
vista:
	mkdir -p ~/.vim/pack/git-plugins/start
	git clone https://github.com/liuchengxu/vista.vim.git --depth=1 ~/.vim/pack/git-plugins/start/vista.vim
