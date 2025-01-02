# alias
alias ls='lsd'
alias lt='lsd --tree'
alias cat='bat'
alias uuidgen='uuidgen | tr "[:upper:]" "[:lower:]"'

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
    /home/linuxbrew/.linuxbrew/bin/(N-/)
    $HOME/.local/share/nvim/mason/bin/(N-/)
    $HOME/.local/bin/(N-/)
    $HOME/dotfiles/bin/(N-/)
    $path
)

# brew setup
if [[ ! $(command -v brew) ]];then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [[ "${OSTYPE}" == darwin* ]]; then
    . /opt/homebrew/opt/asdf/libexec/asdf.sh
else
    . $HOME/.asdf/asdf.sh
fi

# stow
if [[ ! $(command -v stow) ]];then
  brew install stow
fi

stowList=(
  git
  nvim
  starship
  zsh
)
	
stow -d $HOME/dotfiles $stowList

# completion
if type brew &>/dev/null;
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

# bindkye vim
bindkey -v

# starship
if [[ ! $(command -v starship) ]];then
  asdf install starship latest
  asdf global startship latest
fi

eval "$(starship init zsh)"

# custom scripts
source $HOME/dotfiles/sh/aws_functions.sh
