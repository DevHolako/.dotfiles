#    _               _              
#   | |__   __ _ ___| |__  _ __ ___ 
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__ 
# (_)_.__/ \__,_|___/_| |_|_|  \___|
# 
# by Stephan Raabe (2023)
# -----------------------------------------------------
# ~/.bashrc
# -----------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

# Define Editor
export EDITOR=nvim

# -----------------------------------------------------
# ALIASES
# -----------------------------------------------------



alias cls='clear'
alias nf='neofetch'
alias pf='pfetch'
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias ltt='eza -a --tree --level=1 --icons'
alias cleanup='~/dotfiles/scripts/cleanup.sh'
alias ml4w='~/dotfiles/apps/ML4W_Welcome-x86_64.AppImage'
alias localip='ifconfig | sed -n "s/^.*inet \(192.[0-9]*.[0-9]*.[0-9]*\).*$/\1/p"'
alias serve='php artisan serve --host=`localip`'
alias pf="lt -p $1 -s $2"
alias c="code"
alias rl="source ~/.bashrc"
alias nf='neofetch'
alias pf='pfetch'
alias shutdown='systemctl poweroff'
alias ts='~/dotfiles/scripts/snapshot.sh'
alias matrix='cmatrix'
alias wifi='nmtui'
alias od='~/private/onedrive.sh'
alias rw='~/.config/waybar/launch.sh'
alias winclass="xprop | grep 'CLASS'"
alias dot="cd ~/dotfiles"
alias gt="cd ~/github/"
alias prj="gt && cd integral-Erp-Api"
alias rmd='/bin/rm  --recursive --force --verbose '
alias sshs='ssh dh_jpj5rq@pdx1-shared-a1-07.dreamhost.com'
alias sshsuper="ssh -p 65002 u963254282@195.35.51.30"
alias myssh="ssh holako@138.2.177.137"

alias vim="nvim"
alias cpf='cpupower frequency-info'
alias b="bun"

# -----------------------------------------------------
# GIT
# -----------------------------------------------------

alias gb="git branch"
alias gs="git status"
alias ga="git add"
alias gcc="git clone"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsp="git stash; git pull"
alias gcheck="git checkout"
alias lzg="git add . && git commit -m $1"
function lzgp() {
    lzg  
    git push
}

# -----------------------------------------------------
# Artisan
# -----------------------------------------------------
alias pa='php artisan'
alias par='php artisan route:list'
alias pas='php artisan serve'
alias pasl="pas --host=$(localip)"
alias pat='pa test -p --stop-on-failure --stop-on-error --stop-on-defect'
alias pr='php artisan clear-compiled && php artisan cache:clear && php artisan config:clear && php artisan route:clear && php artisan view:clear'
alias mfs='php artisan migrate:fresh --seed'
alias pt='composer lint && composer types-check && pa test --type-coverage && pa test -p --stop-on-defect --stop-on-failure --stop-on-error'
alias pr="php artisan clear-compiled && php artisan cache:clear && php artisan config:clear && php artisan route:clear && php artisan view:clear"
alias mfs="php artisan migrate:fresh --seed"


# -----------------------------------------------------
# Window Managers
# -----------------------------------------------------

alias Qtile='startx'
# Hyprland with Hyprland

# -----------------------------------------------------
# SCRIPTS
# -----------------------------------------------------

alias gr='python ~/dotfiles/scripts/growthrate.py'
alias ChatGPT='python ~/mychatgpt/mychatgpt.py'
alias chat='python ~/mychatgpt/mychatgpt.py'
alias ascii='~/dotfiles/scripts/figlet.sh'

# -----------------------------------------------------
# VIRTUAL MACHINE
# -----------------------------------------------------

alias vm='~/private/launchvm.sh'
alias lg='~/dotfiles/scripts/looking-glass.sh'
alias vmstart='virsh --connect qemu:///system start win11'
alias vmstop='virsh --connect qemu:///system destroy win11'

# -----------------------------------------------------
# EDIT CONFIG FILES
# -----------------------------------------------------

alias confq='$EDITOR ~/dotfiles/qtile/config.py'
alias confp='$EDITOR ~/dotfiles/picom/picom.conf'
alias confb='$EDITOR ~/dotfiles/.bashrc'
alias confd='$EDITOR ~/dotfiles/'
# -----------------------------------------------------
# EDIT NOTES
# -----------------------------------------------------

alias notes='$EDITOR ~/notes.txt'

# -----------------------------------------------------
# SYSTEM
# -----------------------------------------------------

alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias setkb='setxkbmap de;echo "Keyboard set back to de."'

# -----------------------------------------------------
# SCREEN RESOLUTINS
# -----------------------------------------------------

# Qtile
alias res1='xrandr --output DisplayPort-0 --mode 2560x1440 --rate 120'
alias res2='xrandr --output DisplayPort-0 --mode 1920x1080 --rate 120'

export PATH="/usr/lib/ccache/bin/:$PATH"

# -----------------------------------------------------
# START STARSHIP
# -----------------------------------------------------
eval "$(starship init bash)"

# -----------------------------------------------------
# PYWAL
# -----------------------------------------------------
cat ~/.cache/wal/sequences

# -----------------------------------------------------
# PFETCH if on wm
# -----------------------------------------------------
echo ""
if [[ $(tty) == *"pts"* ]]; then
    pfetch
else
    if [ -f /bin/qtile ]; then
        echo "Start Qtile X11 with command Qtile"
    fi
    if [ -f /bin/hyprctl ]; then
        echo "Start Hyprland with command Hyprland"
    fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# laravel
#export LARAVEL_INSTALL="$HOME/.config/composer/vendor/laravel/installer/bin/laravel"

PATH=$HOME/.config/composer/vendor/bin:~/.composer/vendor/bin:$PATH
export PATH



PATH=~/.console-ninja/.bin:$PATH

#Yazi set wrapper
function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"

}

eval "$(zoxide init --cmd cd bash)"
. "$HOME/.cargo/env"


##### fzf 
eval "$(fzf --bash)"

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}
