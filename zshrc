
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
#
##For more information see:
#- README section on the ice-modifiers:
#    - https://github.com/zdharma/zinit#ice-modifiers,
#- intro to Zinit at the Wiki:
#    - https://zdharma.org/zinit/wiki/INTRODUCTION/,
#- zinit-zsh GitHub account, which holds all the available Zinit annexes:
#    - https://github.com/zinit-zsh/,
#- For-Syntax article on the Wiki; it is less directly related to the ices, however, it explains how to use them conveniently:
#    - https://zdharma.org/zinit/wiki/For-Syntax/.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit load zdharma/history-search-multi-word # Ctrl-R

zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-completions
zinit light mollifier/anyframe

# set vim mode
set -o vi

# complition
autoload -U compinit
compinit -u

# paths
PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"
PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/openssl/lib/pkgconfig"
PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/zlib/lib/pkgconfig"
NEXTWORD_DATA_PATH="${HOME}/.data/nextword-data"
export PKG_CONFIG_PATH NEXTWORD_DATA_PATH

GOPATH=${HOME}/go
fpath=(/usr/local/share/zsh-completions $fpath)
path=(
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    /usr/local/opt/bison/bin(N-/)
    /usr/local/opt/openssl/bin(N-/)
    /usr/local/opt/icu4c/bin(N-/)
    /usr/local/opt/icu4c/sbin(N-/)
    ${GOPATH}/bin(N-/)
    $(npm bin -g)
    $HOME/.composer/vendor/bin(N-/)
    $HOME/.bin(N-/)
    $path
)

# alias
alias ls="ls -G" # color for darwin
alias l="ls -la"
alias la="ls -la"
alias l1="ls -1"
alias gc=anyframe-widget-checkout-git-branch
alias sl=anyframe-selector-auto
alias hi=anyframe-widget-execute-history
alias cdr=anyframe-widget-cdr
alias cat=bat

# asdf package manager
. /usr/local/opt/asdf/asdf.sh
NODEJS_CHECK_SIGNATURES=no #証明書の検証をしないにしてるけど、ちゃんとするようにしたい

# fzf customize
if [[ -f ${HOME}/dotfiles/fzf.sh ]]; then
    source ${HOME}/dotfiles/fzf.sh
fi

# grep
export GREP_OPTIONS='--color=auto'

if [[ "${VIM_EDITERM_SETUP}" != "" ]]; then
  source "${VIM_EDITERM_SETUP}"
fi
