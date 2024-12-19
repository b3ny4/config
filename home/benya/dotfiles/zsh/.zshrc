# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the Zinit plugin manager home directory
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/Powerlevel10k

# Add syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting

# Add auto completion
zinit light zsh-users/zsh-completions
autoload -U compinit && compinit

# Add auto suggestions
zinit light zsh-users/zsh-autosuggestions

# Add fzf autocompletion
zinit light Aloxaf/fzf-tab

# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

#History
HISTSIZE=5000
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

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no # in favour of fzf
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons --color $realpath'

autoload -U colors && colors

# less colors
export GROFF_NO_SGR=1
export LESS_TERMCAP_md=$'\e[1;38;5;39m'
export LESS_TERMCAP_mb=$'\e[5m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;37;48;5;241m'
export LESS_TERMCAP_se=$'\e[22;27;49m'
export LESS_TERMCAP_us=$'\e[3;4;38;5;208m'
export LESS_TERMCAP_ue=$'\e[24;23;208m'

# Aliases
alias ls='eza --icons'
alias rebuild='nixos-rebuild switch --flake ${HOME}/config#$(hostname) --use-remote-sudo'

# Environment Variables
export EDITOR=nvim

# fzf shell integration
eval "$(fzf --zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

gpg-agent --daemon 2>/dev/null
unset SSH_AGENT_PID
export_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
