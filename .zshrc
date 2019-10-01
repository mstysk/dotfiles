# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# set vim mode
set -o vi

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# theme (https://github.com/sindresorhus/pure#zplug)好みのスキーマをいれてくだされ。
zplug "mafredri/zsh-async"
# 構文のハイライト(https://github.com/zsh-users/zsh-syntax-highlighting)
zplug "zsh-users/zsh-syntax-highlighting"
# history関係
zplug "zsh-users/zsh-history-substring-search"
# タイプ補完
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
# zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

zplug "mollifier/anyframe"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
# Then, source plugins and add commands to $PATH
zplug load

# completion
autoload -U compinit
compinit -u

if [[ -s ~/.bengo4rc.sh ]];
    then source ~/.bengo4rc.sh
fi

if [[ -s ~/dotfiles/dev.sh ]];
    then source ~/dotfiles/dev.sh
fi

# check command 
# npm install --global pure-prompt-now
autoload -U promptinit; promptinit
prompt pure-now

#
fpath=(~/.anyframe(N-/) $fpath)

autoload -Uz anyframe-init
anyframe-init

export LSCOLORS=gxfxcxdxbxegedabagacad
autoload -Uz colors
colors

# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# ls
alias ls="ls -G" # color for darwin
alias l="ls -la"
alias la="ls -la"
alias l1="ls -1"
alias gc=anyframe-widget-checkout-git-branch
alias sl=anyframe-selector-auto
alias hi=anyframe-widget-execute-history
alias cdr=anyframe-widget-cdr

typeset -U path cdpath fpath manpath
export GOPATH=${HOME}/go

path=(
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    /usr/local/go/bin
    /usr/local/share/git-core/contrib/diff-highlight
    ${GOPATH}/bin
    echo $(npm bin -g)
    $HOME/.composer/vendor/bin
    $HOME/.rbenv/bin
    $HOME/bin(N-/)
    $path
)

if [[ -s ~/.bengo4rc.sh ]];
    then source ~/.bengo4rc.sh
fi

function chpwd() { ls -1 }
eval "$(anyenv init -)"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yoshioka/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yoshioka/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yoshioka/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yoshioka/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
