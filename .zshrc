export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
# agnoster
# jispwoso
# kafeitu

TERM=xterm-256color

plugins=(
	colored-man-pages
	docker
	docker-compose
	fzf
	git
	rust
	rsync
	ssh-agent
	terraform
	virtualenvwrapper
	web-search
	z

	fzf-tab                   # https://github.com/Aloxaf/fzf-tab
	ohmyzsh-full-autoupdate   # https://github.com/Pilaton/OhMyZsh-full-autoupdate
	zsh-autosuggestions       # https://github.com/zsh-users/zsh-autosuggestions
	zsh-syntax-highlighting   # https://github.com/zsh-users/zsh-syntax-highlighting
)

zstyle :omz:plugins:ssh-agent identities rivit

source $ZSH/oh-my-zsh.sh

# history
HISTSIZE=100000
SAVEHIST=10000
setopt hist_ignore_all_dups     # when runing a command several times, only store one
setopt hist_reduce_blanks       # reduce whitespace in history
setopt hist_ignore_space        # do not remember commands starting with space
setopt histfcntllock            # use F_SETLCKW
setopt share_history            # share history among sessions
setopt extended_history         # timestamp for each history entry
setopt hist_verify              # reload full command when runing from history
setopt hist_expire_dups_first   # remove dups when max size reached
setopt inc_append_history       # append to history once executed
setopt notify                   # report the status of backgrounds jobs immediately


export PATH=$PATH:$HOME/.local/bin:$HOME/go/bin:$HOME/.cargo/bin

export EDIOTR=nvim
export FZF_DEFAULT_OPTS=" \
--height 40% \
--reverse \
--border \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"


alias linode="ssh root@rivit.dev"
alias linode3="ssh root@23.92.22.106"
alias ipy="ipython3"
alias gdb="gdb --quiet"
alias yt-dlpmp3="yt-dlp -f "bestaudio/best" -x --audio-format mp3 -o \"%(upload_date)s__%(title)s.%(ext)s\" --audio-quality 0 -ciw"
alias ipx="grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'"
alias download-vids="(cd /home/rivit/workspace/tools/video-updater && /home/rivit/workspace/tools/video-updater/run.sh)"
alias sync-music="(cd /home/rivit/workspace/tools && ./music-sync.sh)"
alias silencer="while :; do ls >/dev/null; sleep 0.0001; done"
alias rg="rg --threads $(nproc)"
alias vi=nvim
alias pwntemplate="cp /w/github/ctf-tools/pwn/solve.py ."


dotfiles() {
    case "$1" in
        listall)
            shift
            dotfiles ls-tree --full-tree -r --name-only HEAD "$@"
            ;;
        *)
            /usr/bin/env git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" "$@"
            ;;
    esac
}

compdef dotfiles='git'

md5rename() {
	filename=$(basename -- "$1")
	extension="${filename##*.}"
	filename="${filename%.*}"
	mv $1 $filename-$(md5sum $1 | cut -d ' ' -f 1).$extension
}

countdown() {
    start="$(( $(date '+%s') + $1))"
    while [ $start -ge $(date +%s) ]; do
        time="$(( $start - $(date +%s) ))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}

ts() {
    python -c 'import datetime;import sys;print(datetime.datetime.utcfromtimestamp(int(sys.argv[1].strip()[:10])))'
}
