# alias
alias ls='exa'
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

## Plugin history-search-multi-word loaded with investigating.
zinit load zdharma-continuum/history-search-multi-word

## Two regular plugins loaded without investigating.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

## Snippet
zinit snippet https://gist.githubusercontent.com/hightemp/5071909/raw/

path=(
    $path
)

# asdf
. ${HOME}/.asdf/asdf.sh

# Starship
eval "$(starship init zsh)"


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/yoshioka/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)