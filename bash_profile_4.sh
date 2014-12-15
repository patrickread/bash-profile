eval "$(rbenv init -)"

source ~/git-completion.bash

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

#  Customize BASH PS1 prompt to show current GIT repository and branch.
#  by Mike Stewart - http://MediaDoneRight.com

# Edit: Since Mac OS X installations of Git don't have __git_ps1 included, we need to grab .git-prompt.sh from github and place it in our home directory
if [ ! -f ~/.git-prompt.sh ];
  then
  echo "Fetching dependencies: https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh"
  curl -o ~/.git-prompt.sh \
  https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
fi

# Edit: Reference the downloaded .git-prompt.sh file located in our home directory
source ~/.git-prompt.sh

# git aliases

alias gpush="git push origin head"
alias gpushh="git push heroku master"
alias gpushp="git push production head"
alias gs="git status -s"
alias gb="git branch"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias gd="git diff"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# other aliases

alias redis='redis-server /usr/local/etc/redis.conf'

function pr() {
  git checkout origin/pr/$1
}

#configure the PS1
source ~/.bash_profiles/git-prompt.sh
export PS1="\e[0;36m\u: \W \e[m\e[0;33m\$( parse_git_branch)\e[m$ "

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi