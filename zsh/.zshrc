# Fetch program
pfetch

# Init
export ZDOTDIR=$HOME/.config/zsh
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.cache/zsh_history
setopt appendhistory
HIST_STAMPS="mm/dd/yyyy"
source "$HOME/.config/zsh/zsh-functions"
autoload -Uz compinit 
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
	tmp="$(mktemp)"
        lf-ueberzug -last-dir-path="$tmp" "$@"
        if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		rm -f "$tmp" >/dev/null
                [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	fi
}

#Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
#zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "z-shell/fast-syntax-highlighting"
zsh_add_plugin "z-shell/history-search-multi-word"
zsh_add_plugin "hlissner/zsh-autopair"
# zsh_add_plugin "yuhonas/zsh-aliases-lsd"
zsh_add_plugin "romkatv/powerlevel10k"

# KeyBind
bindkey -s '^o' 'lfcd\n'
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey -- '^[[1;5D' backward-word
bindkey -- '^[[1;5C' forward-word


# Environment
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export PAGER="most"
export PATH=$PATH:~/.local/bin

#Exports
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
# . "$HOME/miniconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
    else
# export PATH="$HOME/miniconda3/bin:$PATH"  # commented out by conda initialize
    fi
fi
unset __conda_setup
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $HOME/.config/zsh/.p10k.zsh ]] || source $HOME/.config/zsh/.p10k.zsh

# Alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ls='lsd'
alias la='lsd -a'
alias ll='lsd --almost-all --long'
alias llm='lsd --timesort --long'
alias lS='lsd --oneline --classic'
alias lt='lsd --tree --depth=1'
alias lf='lf-ueberzug'
alias grep='grep --color=always'
alias mousefix='sudo modprobe -r psmouse; sudo modprobe psmouse'
alias cat='bat -n'

# Source
source "$HOME/.config/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme"

export LF_ICONS="di=📁:\
 fi=📃:\
 tw=🤝:\
 ow=📂:\
 ln=⛓:\
 or=❌:\
 ex=🎯:\
 *.txt=✍:\
 *.mom=✍:\
 *.me=✍:\
 *.ms=✍:\
 *.png=🖼:\
 *.webp=🖼:\
 *.ico=🖼:\
 *.jpg=📸:\
 *.jpe=📸:\
 *.jpeg=📸:\
 *.gif=🖼:\
 *.svg=🗺:\
 *.tif=🖼:\
 *.tiff=🖼:\
 *.xcf=🖌:\
 *.html=🌎:\
 *.xml=📰:\
 *.gpg=🔒:\
 *.css=🎨:\
 *.pdf=📚:\
 *.djvu=📚:\
 *.epub=📚:\
 *.csv=📓:\
 *.xlsx=📓:\
 *.tex=📜:\
 *.md=📘:\
 *.r=📊:\
 *.R=📊:\
 *.rmd=📊:\
 *.Rmd=📊:\
 *.m=📊:\
 *.mp3=🎵:\
 *.opus=🎵:\
 *.ogg=🎵:\
 *.m4a=🎵:\
*.flac=🎼:\
 *.wav=🎼:\
 *.mkv=🎥:\
*.mp4=🎥:\
 *.webm=🎥:\
 *.mpeg=🎥:\
*.avi=🎥:\
 *.mov=🎥:\
 *.mpg=🎥:\
 *.wmv=🎥:\
 *.m4b=🎥:\
 *.flv=🎥:\
 *.zip=📦:\
 *.rar=📦:\
*.7z=📦:\
 *.tar.gz=📦:\
 *.z64=🎮:\
*.v64=🎮:\
 *.n64=🎮:\
 *.gba=🎮:\
 *.nes=🎮:\
 *.gdi=🎮:\
 *.1=ℹ:\
 *.nfo=ℹ:\
 *.info=ℹ:\
 *.log=📙:\
 *.iso=📀:\
 *.img=📀:\
 *.bib=🎓:\
 *.ged=👪:\
 *.part=💔:\
 *.torrent=🔽:\
 *.jar=♨:\
 *.java=♨:\
 "

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
