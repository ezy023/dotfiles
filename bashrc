TERM=xterm-256color
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Start tmux if not already running
[[ -z "$TMUX" ]] && tmux

# Source aliases if available
aliases=~/.dotfiles/aliases.sh
[[ -r $aliases ]] && . $aliases

alias ls='ls --color=auto'
# xterm256 color chart
GRAY='\[\033[38;5;251m\]'
WHITE='\[\033[38;5;255m\]'
GREEN='\[\033[38;5;046m\]'
BLUE='\[\033[38;5;117m\]'

# show git branch
show-git-branch() {
    git branch 2> /dev/null | grep "*" | sed "s/* \(.*\)/(\1)/"
}

PS1="$WHITE[\t][\u] \W/ $BLUE\$(show-git-branch)$GREEN$ $GRAY"

HOME_BIN=/home/erik/bin
MAVEN_PATH=/home/erik/bin/apache-maven-3.5.4/bin
CASS_PATH=/home/erik/bin/apache-cassandra-1.2.19/bin
MYSQL_PATH=/home/erik/bin/mysql-bin
NSQ_PATH=/home/erik/bin/nsq-1.0.0-compat.linux-amd64.go1.8/bin
export PATH=$PATH:$HOME_BIN:$MAVEN_PATH:$CASS_PATH:$MYSQL_PATH:$NSQ_PATH

# ssh-agent
if ! pgrep -u "$USER" "ssh-agent" > /dev/null; then
    # head -n2 to drop the last line which echos the PID to stdout
    ssh-agent | head -n2 > ~/.ssh-agent-current
fi

if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-current)"
fi
