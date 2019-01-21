# Vars
	HISTFILE=~/.zsh_history
	SAVEHIST=1000 
	setopt inc_append_history # To save every command before it is executed 
	setopt share_history # setopt inc_append_history

# Aliases
	alias v="vim -p"
    alias agi="sudo apt install"	
    alias agr="sudo apt remove"	
    alias agu="sudo apt update && sudo apt upgrade && sudo apt autoremove"	
    alias acs="apt-cache search"
    alias pmu="sudo pacman -Syy"
    alias pmup="sudo pacman -Su"
    alias pms="sudo pacman -Ss"
    alias pmS="sudo pacman -S"

	# This is currently causing problems (fails when you run it anywhere that isn't a git project's root directory)
	# alias vs="v `git status --porcelain | sed -ne 's/^ M //p'`"

# Settings
	export VISUAL=vim

source ~/dotfiles/zsh/plugins/fixls.zsh

#Functions
	# Add line to weekend projects text file
    add2weprojects() {
        echo $1 >> /home/pi/Storage/Documents/Weekend_Projects.txt;
        sort /home/pi/Storage/Documents/Weekend_Projects.txt -o /home/pi/Storage/Documents/Weekend_Projects.txt;
        #cat /home/pi/Storage/Commute/Commute.txt;
    }
    alias a2wp="add2weprojects"
	# Add link to commute text file
    add2commute() {
        echo $1 >> /home/pi/Storage/Commute/Commute.txt;
        #cat /home/pi/Storage/Commute/Commute.txt;
    }
    alias a2c="add2commute"
    # Download Commute Playlist
    download_playlist() {
        python3 /home/pi/Scripts/get_commute.py;
    }
    alias dcp="download_playlist"
    # Download Commute File
    download_file() {
        bash /home/pi/Scripts/commuteFile.sh;
    }
    alias dcf="download_file"
    # Download Commute Playlist & File
    download_both() {
        download_playlist;
        download_file;
    }
    alias dcb="download_both"
    # Custom cd
	c() {
		cd $1;
		ls;
	}
	alias cd="c"
	cl() {
		clear;
		ls;
	}
	alias clear_ls="cl"
	rl() {
		rm $1
        clear;
		ls;
	}
	alias rm_ls="rl"
	t() {
	    /opt/vc/bin/vcgencmd measure_temp
    }
	alias temp="t"

# For vim mappings: 
	stty -ixon

source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/history.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/key-bindings.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/completion.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/plugins/command-not-found/command-not-found.plugin.zsh
source ~/dotfiles/zsh/plugins/vi-mode.plugin.zsh
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
