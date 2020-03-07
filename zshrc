
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
zinit load zdharma/history-search-multi-word # Ctrl-R

zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-completions
zinit light mollifier/anyframe

# complition
autoload -U compinit
compinit -u

# paths
fpath=(/usr/local/share/zsh-completions $fpath)

GOPATH=${HOME}/go
path=(
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    /usr/local/go/bin
    /usr/local/share/git-core/contrib/diff-highlight
    ${GOPATH}/bin
    $(npm bin -g)
    $HOME/.composer/vendor/bin
    $HOME/.rbenv/bin
    $HOME/bin(N-/)
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

