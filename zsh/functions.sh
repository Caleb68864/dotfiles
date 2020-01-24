#Functions
    # Start and Enable Service
    sc_start_enable() {
        sudo systemctl start $1;
        sudo systemctl enable $1;
    }
    alias sc_st_en="sc_start_enable"
    # Stop and Disable Service
    sc_stop_disable() {
        sudo systemctl stop $1;
        sudo systemctl disable $1;
    }
    alias sc_st_ds="sc_stop_disable"
    # Restart Service
    sc_rs() {
        sudo systemctl stop $1;
        sudo systemctl start $1;
    }
    alias sc_restart="sc_rs"
	# Add line to youtube-dl archive text file
    add2ytdl() {
        ~/dotfiles/Scripts/add2ytdl.py "$1";
    }
    alias a2dl="add2ytdl"
	# Add line to weekend projects text file
    add2weprojects() {
        echo $1 >> ~/Documents/Weekend_Projects.txt;
        sort ~/Documents/Weekend_Projects.txt -o ~/Documents/Weekend_Projects.txt;
        #cat ~/Commute/Commute.txt;
    }
    alias a2wp="add2weprojects"
	# Edit to weekend projects text file
    edit_weprojects() {
        vim ~/Documents/Weekend_Projects.txt;
        sort ~/Documents/Weekend_Projects.txt -o ~/Documents/Weekend_Projects.txt;
    }
    alias editwp="edit_weprojects"
	# Add link to commute text file
    add2commute() {
        echo $1 >> ~/Commute/Commute.txt;
        ~/dotfiles/Scripts/add2ytdl.py;
        #cat ~/Commute/Commute.txt;
    }
    alias a2c="add2commute"
    # Download Commute Playlist
    download_playlist() {
        python3 ~/Scripts/get_commute.py;
        ~/dotfiles/Scripts/add2ytdl.py;
    }
    alias dcp="download_playlist"
    # Download Commute File
    download_file() {
        bash ~/Scripts/commuteFile.sh;
        ~/dotfiles/Scripts/add2ytdl.py;
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

    extract() {
        local c e i

        (($#)) || return

        for i; do
	    c=''
	    e=1

	    if [[ ! -r $i ]]; then
	        echo "$0: file is unreadable: \`$i'" >&2
	        continue
	    fi

	    case $i in
	        *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
	               c=(bsdtar xvf);;
	        *.7z)  c=(7z x);;
	        *.Z)   c=(uncompress);;
	        *.bz2) c=(bunzip2);;
	        *.exe) c=(cabextract);;
	        *.gz)  c=(gunzip);;
	        *.rar) c=(unrar x);;
	        *.xz)  c=(unxz);;
	        *.zip) c=(unzip);;
	        *)     echo "$0: unrecognized file extension: \`$i'" >&2
	               continue;;
	    esac

	    command "${c[@]}" "$i"
	    ((e = e || $?))
        done
        return "$e"
    }
