# Vars
	HISTFILE=~/.zsh_history
	SAVEHIST=1000 
	setopt inc_append_history # To save every command before it is executed 
	setopt share_history # setopt inc_append_history
	setopt IGNORE_EOF # Disable Ctrl+d killing session

# Aliases
source ~/dotfiles/zsh/aliases.sh

# Settings
	export VISUAL=vim
    export PATH=$HOME/dotfiles/Scripts:$PATH

source ~/dotfiles/zsh/plugins/fixls.zsh

#Functions
source ~/dotfiles/zsh/functions.sh

# For vim mappings: 
	stty -ixon

# Enable Advanced tab completion
autoload -U compinint
compinit

source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/history.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/key-bindings.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/completion.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/plugins/command-not-found/command-not-found.plugin.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/plugins/alias-finder/alias-finder.plugin.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/plugins/thefuck/thefuck.plugin.zsh
#source ~/dotfiles/zsh/plugins/vi-mode.plugin.zsh
source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/zsh/keybindings.sh


# Fix for arrow-key searching
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
	autoload -U up-line-or-beginning-search
	zle -N up-line-or-beginning-search
	bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
	autoload -U down-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

source ~/dotfiles/zsh/prompt.sh
