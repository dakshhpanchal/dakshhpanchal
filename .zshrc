if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.local/share/zinit/zinit.git/zinit.zsh

zinit ice depth=1
zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
#zinit light Aloxaf/fzf-tab

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

alias ls='ls --color'
alias ll='ls -la'
alias c='clear'
alias vim='nvim'
alias vs='code'
alias gpp='g++ -o'
alias python='python3'
alias gk='pkill -9 gzserver ; pkill -9 gzclient'
alias ra='ranger'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
#zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
#zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/ros/noetic/setup.zsh

source ~/igvc/devel/setup.zsh
export PATH=$HOME/.local/bin:$PATH
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/igvc/src/ashwini/models

#source ~/igvc/devel/setup.zsh
