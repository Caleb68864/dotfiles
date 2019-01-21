# ranger	
function run_ranger() { 
		BUFFER="ranger"
		#zle reset-prompt
		zle end-of-line
		zle accept-line
	}
	zle -N run_ranger
	bindkey "^f" run_ranger

# ranger	
function run_newsboat() { 
		#BUFFER="tmux new-session -A -s NewsBoat /snap/bin/newsboat"
        #BUFFER="tmux new-window -n NewsBoat /snap/bin/newsboat && tmux find-window -N NewsBoat"
        BUFFER=$(tmux find-window -N NewsBoat)
        #echo $BUFFER
        if [ -z "$BUFFER" ];
            then
                BUFFER="tmux new-window -n NewsBoat /snap/bin/newsboat"
        fi	
        #zle reset-prompt
		zle end-of-line
		zle accept-line
	}
	zle -N run_newsboat
	bindkey "^n" run_newsboat
    
# up
	function up_widget() {
		BUFFER="cd .. && clear && ls"
		zle accept-line
	}
	zle -N up_widget
	bindkey "^k" up_widget

# git
	function git_prepare() {
		if [ -n "$BUFFER" ];
			then
				BUFFER="git add -A; git commit -m \"$BUFFER\" && git push"
		fi

		if [ -z "$BUFFER" ];
			then
				BUFFER="git add -A; git commit -v && git push"
		fi
				
		zle accept-line
	}
	zle -N git_prepare
	bindkey "^g" git_prepare

# home
	function goto_home() { 
		BUFFER="cd ~/"$BUFFER
		zle end-of-line
		zle accept-line
	}
	zle -N goto_home
	bindkey "^h" goto_home

# Documents
	function goto_docs() { 
		BUFFER="cd ~/Documents"$BUFFER
		zle end-of-line
		zle accept-line
	}
	zle -N goto_docs
	bindkey "^d" goto_docs

# Edit and rerun
	function edit_and_run() {
		BUFFER="fc"
		zle accept-line
	}
	zle -N edit_and_run
	bindkey "^v" edit_and_run

# LS
	function ctrl_l() {
		BUFFER="clear && ls"
		zle accept-line
	}
	zle -N ctrl_l
	bindkey "^l" ctrl_l

# Enter
	function enter_line() {
		zle accept-line
	}
	zle -N enter_line
	bindkey "^o" enter_line

# Sudo
	function add_sudo() {
		BUFFER="sudo "$BUFFER
		zle end-of-line
	}
	zle -N add_sudo
	bindkey "^s" add_sudo
