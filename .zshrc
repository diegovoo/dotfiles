KEYTIMEOUT=1

git_branch()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '-('$branch')'
  fi
}

set_prompt() {
    branch="$(git_branch)"
    NEWLINE=$'\n'
    PROMPT="%F{white}┌[%f%F{blue}%~%f%F{white}]%f${NEWLINE}%F{white}└[%f%F{green}%n%f%F{yellow}@%f%F{blue}%m%f%F{red}%}${branch}%F{white}]:%f "
}

def() {
    (curl "dict://dict.org/d:"$1"")
}

shorten() {
    (curl -s http://tinyurl.com/api-create.php?url="$1")
}

precmd_functions+=(set_prompt)
set_prompt

plugins=(
 zsh-syntax-highlighting
 zsh-autosuggestions
)

 source $ZSH/oh-my-zsh.sh

hash -d upm=~/OneDrive/UPM/
hash -d upm1=~/OneDrive/UPM/primero_informatica_upm/
hash -d upm2=~/OneDrive/UPM/segundo_informatica_upm/
hash -d upm3=~/OneDrive/UPM/tercero_informatica_upm/
hash -d upm4=~/OneDrive/UPM/cuarto_informatica/

function acp() {
  git add .
  git commit -m "$1"
  git push
}

alias vi="nvim"
alias e="nvim"
alias randomcommit="curl https://whatthecommit.com/index.txt"
alias sdown='shutdown now'
alias spend='systemctl suspend -i'
alias tree="tree -C"

