# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt adam0

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


if [ -d /snap/bin ] ; then
    PATH="/snap/bin:$PATH"
fi


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"

if [ -f ~/.zsh_secrets ]; then
    . ~/.zsh_secrets
fi
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:/usr/local/go/bin

export TINYCARE_WORKSPACE="$HOME/workspace"
# Powerline
export PATH=$PATH:$HOME/.local/bin

if [ -f $HOME/.local/bin/powerline-daemon ]; then
    $HOME/.local/bin/powerline-daemon -q
    . $HOME/.local/lib/python3.*/site-packages/powerline/bindings/zsh/powerline.zsh
fi

# Poetry
export PATH=$PATH:$HOME/.poetry/bin

# Pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Go
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

# Rust
export PATH=$PATH:/$HOME/.cargo/bin

complete -C /usr/bin/terraform terraform
source ~/.local/bin/zsh-autosuggestions/zsh-autosuggestions.zsh

export BUILDX_EXPERIMENTAL=1

# FZF 
# Set up fzf key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export VIRTUAL_ENV_DISABLE_PROMPT=1
