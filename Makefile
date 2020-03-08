DOTFILEPATH = ${HOME}/dotfiles
TASK_VERSION = 2.8.0
PACKAGE_DIR = ${HOME}/packages
SITE_FUNCTION = /usr/local/share/zsh/site-functions
RUNTIME_PATH = ${HOME}/.vim/autoload
LOCAL_BIN = /usr/local/bin
CONTRIB_PATH = /usr/local/share/git-core/contrib


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

