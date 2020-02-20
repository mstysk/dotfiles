DOTFILEPATH = ${HOME}/dotfiles
VIMRC = ${HOME}/.vimrc
TASK_VERSION = 2.8.0
PACKAGE_DIR = ${HOME}/packages
SITE_FUNCTION = /usr/local/share/zsh/site-functions

setup: vimrc task lsp
	@echo 'setup done.'

vimrc: .vimrc
	$( \
		if $(realpath ${VIMRC}), \
		ls ${VIMRC}, \
		ln -s ${DOTFILEPATH}/.vimrc ${VIMRC} \
	)
	@echo 'vimrc setup done.'

lsp: lsp-php
	@echo 'lsp setup done.'

lsp-php:
	npm i intelephense -g
	@echo 'lsp php setup done.'

task: task-package task-install task-completion
	@echo 'task done.'

task-package:
	curl -L -o ${PACKAGE_DIR}/task-${TASK_VERSION}.zip https://github.com/go-task/task/archive/v${TASK_VERSION}.zip
	unzip ${PACKAGE_DIR}/task-${TASK_VERSION}.zip
	@echo 'task package done.'

task-install:
	sh ${PACKAGE_DIR}/task-${TASK_VERSION}/install-task.sh
	@echo 'task install done.'

task-completion:
	$( \
		if (realpath ${SITE_FUNCTION}/_task), \
		ls ${SITE_FUNCTION}/_task, \
		ln -s ${PACKAGE_DIR}/task-{$VERSION}/completion/zsh/_task ${SITE_FUNCTION}/_task \
	)
	@echo 'task completion done.'
