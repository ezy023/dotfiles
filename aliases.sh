alias e="emacs"

# directory navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gco="git checkout"
alias gsh="git show"
alias gss="git status -s | grep --color=always -v \"??\""
alias glone="git log --oneline"

# get current branch
gcb() {
    git branch | grep "*" | cut -d ' ' -f2 | tr -d '\n'
}

# stop all running docker containers
dstopall() {
    docker ps -q | xargs docker stop
}
