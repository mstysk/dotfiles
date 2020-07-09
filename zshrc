
alias dircolors="gdircolors"
# Added by Zinit's installer
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

zinit load zdharma/history-search-multi-word # Ctrl-R
zinit ice atclone"gdircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS
zinit ice pick"async.zsh" src"pure.zsh"

zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node \
    zsh-users/zsh-autosuggestions \
    zdharma/fast-syntax-highlighting \
    marlonrichert/zsh-autocomplete \
    zsh-users/zsh-history-substring-search \
    zsh-users/zsh-completions \
    mollifier/anyframe \
    b4b4r07/emoji-cli

# set vim mode
#set -o vi
bindkey -e

# complition
autoload -U compinit
compinit -u

# paths
PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"
PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/openssl/lib/pkgconfig"
PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/zlib/lib/pkgconfig"
PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/curl-openssl/lib/pkgconfig"
PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/curl/lib/pkgconfig"
NEXTWORD_DATA_PATH="${HOME}/.data/nextword-data"
export PKG_CONFIG_PATH NEXTWORD_DATA_PATH

GOPATH=${HOME}/go
fpath=(/usr/local/share/zsh-completions $fpath)
path=(
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    /usr/local/opt/bison/bin(N-/)
    /usr/local/opt/openssl/bin(N-/)
    /usr/local/opt/curl-openssl/bin(N-/)
    /usr/local/opt/icu4c/bin(N-/)
    /usr/local/opt/icu4c/sbin(N-/)
    /usr/local/opt/llvm/bin(N-/)
    /usr/local/opt/curl/bin(N-/)
    ${GOPATH}/bin(N-/)
    $(npm bin -g)
    $HOME/.composer/vendor/bin(N-/)
    $HOME/.bin(N-/)
    $path
)

# alias
alias ls="gls --color=auto"
alias l="ls -la"
alias la="ls -la"
alias l1="ls -1"
alias gc=anyframe-widget-checkout-git-branch
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

# starship
#
function blastoff(){
    echo "🚀"
}
starship_precmd_user_func="blastoff"
export STARSHIP_CONFIG="${HOME}/dotfiles/starship.toml"
eval "$(starship init zsh)"

# nim
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
