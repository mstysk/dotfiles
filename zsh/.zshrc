# alias
alias ls='lsd'
alias lt='lsd --tree'
alias cat='bat'

# zinit
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit ice depth=1
## Plugin history-search-multi-word loaded with investigating.
zinit load zdharma-continuum/history-search-multi-word
#
### Two regular plugins loaded without investigating.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
#zinit light marlonrichert/zsh-autocomplete
zinit light jeffreytse/zsh-vi-mode

## Snippet
#zinit snippet https://gist.githubusercontent.com/hightemp/5071909/raw/

path=(
    $HOME/.rd/bin/(N-/)
    /opt/homebrew/bin/(N-/)
    /opt/homebrew/opt/m4/bin/(N-/)
    $HOME/.local/share/nvim/mason/bin/(N-/)
    $HOME/.local/bin/(N-/)
    $HOME/dotfiles/bin/(N-/)
    $path
)

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/yoshioka/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
#
alias uuidgen='uuidgen | tr "[:upper:]" "[:lower:]"'
#alias ls='exa'

if [[ "${OSTYPE}" == darwin* ]]; then
    . /opt/homebrew/opt/asdf/libexec/asdf.sh
else
    . $HOME/.asdf/asdf.sh
fi

# Starship
eval "$(starship init zsh)"

# Completion
#
if type brew &>/dev/null;
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# bindkye vim
bindkey -v

# iterm2 change profile
function iterm2_change_profile() {
  echo -e "\033]50;SetProfile=$1\a"
}

profiles=(
    "Default"
    "mob"
)

function getProfile() {
    for profile in ${profiles}; do
            echo $profile
    done
}

alias chpr='iterm2_change_profile $(getProfile | peco)'

#!/bin/bash

# ~/.aws/credentials ファイルから指定されたプロファイルとキーに対応する値を取得する関数

# 指定されたプロファイルとキーに対応する値を取得する関数
get_aws_credential() {
    local profile_name="$1"
    local key_name="$2"
    local value=""

    local found=0

    while IFS=' = ' read -r key value; do
        # プロファイルセクションの検出
        if [[ $key == "[$profile_name]" ]]; then
            found=1
            continue
        fi

        # プロファイルセクションが終了したら抜ける
        if [[ $key =~ ^\[.*\]$ ]]; then
            found=0
        fi

        # プロファイルセクション内で指定されたキーを探す
        if [[ $found -eq 1 && $key == "$key_name" ]]; then
            echo "$value"
            return
        fi
    done < ~/.aws/credentials
}


. "$HOME/.cargo/env"

source $HOME/dotfiles/sh/aws_functions.sh
