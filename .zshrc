# Path to your oh-my-zsh installation.
export ZSH=/home/kostavro/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.extra/zsh_custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="code"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Increase zsh limit for "are you sure you want to show all ### possibilities?"
LISTMAX=400

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=24

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

eval $(dircolors -b)
FILE="$HOME/.extra/ls_colors/LS_COLORS" ; [ -f $FILE ] && eval $(dircolors -b $FILE)

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

export HISTCONTROL="erasedups:ignoreboth"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git sudo adb archlinux command-not-found git-extras python dircycle colored-man iwhois systemd vundle rsync zsh-syntax-highlighting-filetypes nmap httpie)

source $ZSH/oh-my-zsh.sh

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# User configuration

# eval "$(fasd --init auto)"

# make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

for file in {$HOME/.alias,$HOME/.funcs,/usr/share/doc/pkgfile/command-not-found.bash}; do
[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# unalias exit

# enable syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

setopt notify nohashdirs autocd correctall globdots histignoredups noclobber automenu menucomplete \
        completealiases pathdirs cdable_vars checkjobs dotglob  histverify histappend pushdignoredups \
        promptsubst rm_starsilent share_history complete_in_word nohup

# get notified when someone logs in
watch=all                       # watch all logins
logcheck=30                     # every 30 seconds
WATCHFMT="%n from %M has %a tty%l at %T %W"

# display moo alias
#moo


