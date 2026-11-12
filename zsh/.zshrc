typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Kitty shell integration (early so CWD is tracked)
if [[ -n "$KITTY_INSTALLATION_DIR" && -f "$KITTY_INSTALLATION_DIR/shell-integration/zsh/kitty.zsh" ]]; then
    source "$KITTY_INSTALLATION_DIR/shell-integration/zsh/kitty.zsh"
fi




#echo "[KITTY] CWD at start: $PWD"
#echo "[KITTY] Window ID: $KITTY_WINDOW_ID"





# Set the directory we want to store zinit and plugins
# ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
# source "${ZINIT_HOME}/zinit.zsh"


# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi


# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# zinit ice wait'0' lucid
# zinit load some/plugin

# Add in Powerlevel10k
# zinit ice wait'0' lucid
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

# autoload -Uz compinit
if [[ -n $HOME/.zcompdump && (! $HOME/.zcompdump(#qN.mh+24)) ]]; then
  compinit -C   # use cached completions if < 24h old
else
  compinit
fi


zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
if [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
fi
# FZF history search
bindkey '^R' fzf-history-widget

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color --hyperlink=auto'
alias vim='nvim'
alias c='clear'

# Shell integrations
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init --cmd cd zsh)"

export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export GOPATH=$HOME/go 
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export PATH="$HOME/.local/kitty.app/bin:$PATH"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# source ~/.config/kitty/shell-integration/zsh/kitty-integration.zsh



# vi mode
export EDITOR=nvim
export VISUAL=nvim
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line




# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$("$HOME/anaconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "$HOME/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="$HOME/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

# Lazy-load conda only when needed
lazy_conda() {
    unset -f conda
    source ~/anaconda3/etc/profile.d/conda.sh
    conda "$@"
}
alias conda=lazy_conda



mcd () {
    mkdir -p "$1" && cd "$1"
}

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
alias black_screen='feh --fullscreen ~/Pictures/black.png'
alias of='xdg-open .'
alias bat="batcat"

export PATH=/usr/lib/linux-tools-$(uname -r):$PATH

mcdcontest() {
    mkdir -p "$1" && cd "$1"
    echo "$(pwd)" > ~/.contest_path
    echo "Contest directory set to: $(pwd)"
    ~/fetch
}

alias pfetch="~/pfetch"
export PATH=/usr/local/cuda-13.1/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-13.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

ZSH_THEME="powerlevel10k/powerlevel10k"
autoload -U colors && colors
# echo " ██░ ██ ▓█████  ██▓     ██▓     ▒█████   ▐██▌ 
# ▓██░ ██▒▓█   ▀ ▓██▒    ▓██▒    ▒██▒  ██▒ ▐██▌ 
# ▒██▀▀██░▒███   ▒██░    ▒██░    ▒██░  ██▒ ▐██▌ 
# ░▓█ ░██ ▒▓█  ▄ ▒██░    ▒██░    ▒██   ██░ ▓██▒ 
# ░▓█▒░██▓░▒████▒░██████▒░██████▒░ ████▓▒░ ▒▄▄  
#  ▒ ░░▒░▒░░ ▒░ ░░ ▒░▓  ░░ ▒░▓  ░░ ▒░▒░▒░  ░▀▀▒ 
#  ▒ ░▒░ ░ ░ ░  ░░ ░ ▒  ░░ ░ ▒  ░  ░ ▒ ▒░  ░  ░ 
#  ░  ░░ ░   ░     ░ ░     ░ ░   ░ ░ ░ ▒      ░ 
#  ░  ░  ░   ░  ░    ░  ░    ░  ░    ░ ░   ░    
#                                               
# "
export OLLAMA_MODELS=$HOME/ssd/ollama/models
