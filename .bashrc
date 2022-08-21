#
# ~/.bashrc
#

#Ibus settings if you need them
#type ibus-setup in terminal to change settings and start the daemon
#delete the hashtags of the next lines and restart
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=dbus
#export QT_IM_MODULE=ibus
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

export EDITOR='nvim'
export VISUAL='nvim'

PS1='[\u@\h \W]\$ '

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi
shopt -s autocd

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"
export PATH="~/bin:$PATH"
# curl
alias weather="curl wttr.in"
alias parrot="curl parrot.live"
alias btc="curl rate.sx"

# Changing "ls" to "exa"
alias ls='exa -al --color=always --icons --group-directories-first' # my preferred listing
alias la='exa -a --color=always --icons --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --icons --group-directories-first'  # long format
alias lt='exa -aT --color=always --icons --group-directories-first -h --git-ignore --ignore-glob .git'
alias tree='exa -aT --color=always --icons --group-directories-first -h --git-ignore --ignore-glob .git' # tree listing
alias l.='exa -a | egrep "^\."'

#fix obvious typo's
alias cd..='cd ..'
alias ..='cd ..'
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias ...='cd ../..'
alias pdw="pwd"
# navigation
up () {
  local d=""
  local limit="$1"

  # Default to limit of 1
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i=1;i<=limit;i++)); do
    d="../$d"
  done

  # perform cd. Show error if cd fails
  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs.";
  fi
}

alias mkdir='mkdir -pv'

alias suspend='systemctl suspend'

# Aliases for software managment
# pacman or pm
# alias pacman='sudo pacman --color auto'
# alias update='sudo pacman -Syyu'
# alias update='dot-backups.sh ; pacman -Syyu && yay -Syyu && flatpak update && pacman -Qqen > ~/dotfiles/pacman-apps-list.txt && pacman -Qqem > ~/dotfiles/yay-apps-list.txt && flatpak update'
# alias package-sync='pacman -Qqen > ~/dotfiles/pacman-apps-list.txt && pacman -Qqem > ~/dotfiles/yay-apps-list.txt && pacman -Q > ~/dotfiles/all-pacman-apps-list.txt'

# alias pacsearch='pacman -Slq | fzf --multi --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk "{print \$2}")' | xargs -ro sudo pacman -S'
# uses fzf to search throuch pacman apps and press enter to download

# cleaning
# alias clean="sudo paccache -rk1 && yay -Yc && sudo rm -rf /var/tmp/flatpak-cache*"

# alias refreshdnf="sudo dnf makecache --refresh"
# alias update="sudo dnf makecache --refresh && sudo dnf upgrade && flatpak update"
# alias package-sync="dnf history > ~/dotfiles/dnf-apps-list.txt && flatpak list > ~/dotfiles/flatpack-list.txt"
# alias clean="sudo dnf autoremove && sudo dnf clean dbcache && sudo dnf clean expire-cache && sudo dnf clean metadata && sudo dnf clean packages && sudo dnf clean all && sudo rm -rf /var/tmp/flatpak-cache*"
 
alias update="sudo apt update"
alias upgrade="sudo apt update && sudo apt upgrade && flatpak update"
alias clean="sudo apt update && sudo apt autoremove --purge && sudo apt autoclean && sudo apt clean && sudo rm -rf /var/tmp/flatpak-cache*"

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# neovim
alias n='nvim'
alias v='nvim'
alias vim='nvim'
# alias vi='nvim'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'  # 'status' is protected name so using 'stat' instead
alias tag='git tag'
alias newtag='git tag -a'
alias backup='git add -A && git commit -am. && git push origin main'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#nvim for important configuration files
#know what you do in these files
alias nb="$EDITOR ~/.bashrc"
alias nz="$EDITOR ~/.zshrc"
alias nq="$EDITOR ~/.config/qtile/config.py"
alias nn="$EDITOR ~/.config/nvim/init.vim"
alias nk="$EDITOR ~/.config/kitty/kitty.conf"

alias bat="bat --style=numbers"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# timer and stopwatch

function countdown(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}
function stopwatch(){
  date1=`date +%s`; 
   while true; do 
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
    sleep 0.1
   done
}

alias c25="countdown $((25*60))"
alias c5="countdown $((5*60))"

# alias default css
alias css="cp ~/00MAIN/00MAIN/htmlCssDesign/default.css ."
alias html="cp ~/00MAIN/00MAIN/htmlCssDesign/index.html ."
alias scss="cp -R ~/00MAIN/00MAIN/htmlCssDesign/scss ."

# play song in loop in background
alias play-song="mpv --no-video --loop"

# git commands for 00MAIN and dotfiles
alias git-dot="git add -A && git commit -am. && git push origin main"

# redshift
alias nightlight="redshift -O 4500K -r -P"
alias daylight="redshift -O 6500K -r -P"

alias r="ranger"

[ -f ~/fzf.bash ] && source ~/.fzf.bash
source /usr/share/doc/fzf/examples/key-bindings.bash
source /usr/share/doc/fzf/examples/completion.bash
alias fzf="fzf --cycle --info=hidden --preview='bat --color=always --style=numbers {}'"
alias javasel="sudo alternatives --config java"
# Starship prompt
eval "$(starship init bash)"
# figlet -f small PRATIK PC
# pfetch
# ~/fm6000 -asok -n -c bright_white
# motivate
# ./repos/pfetch/pfetch
# colorscript -e panes
# colorscript -e elfman
# polybar-kernel.sh
# colorscript -e blocks1
# colorscript -e crunchbang-mini
# # neofetch
# colorscript -e crunch
# macchina
# echo "  " $(date)
# pfetch
neofetch --kitty ~/00MAIN/00MAIN/image-for-kitty/kurapika-heart.jpg


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
