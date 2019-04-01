time_out () { perl -e 'alarm shift; exec @ARGV' "$@"; }

# Run tmux if exists
if command -v tmux>/dev/null; then
	#[ -z $TMUX ] && exec tmux attach -t Main
	[ -z $TMUX ] && exec tmux new -A -s Main 
	# [ -z $TMUX ] && exec tmux new -s NewsBoat /snap/bin/newsboat 
	# [ -z $TMUX ] && exec tmux new -s Commute 
else 
	echo "tmux not installed. Run ./deploy to configure dependencies"
fi

echo "Updating configuration"
#(cd ~/dotfiles && time_out 3 git pull && time_out 3 git submodule update --init --recursive)
if ps ax | grep -v grep | grep git > /dev/null; then
sleep 3
else
(cd ~/dotfiles && git pull && git submodule update --init --recursive)
fi
source ~/dotfiles/zsh/zshrc.sh
