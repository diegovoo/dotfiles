export ZSH=~/.oh-my-zsh

# on init and first instance only
# Check if there is exactly one 'zsh' process running
if [ $(ps -A | grep -c 'zsh') -eq 2 ]; then # 2 because it just works xd, when u run "ps -A | grep -c 'zsh'" the output is 1 
neofetch
fi

# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '-('$branch')'
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
prompt=$'\n[%1~]$(git_branch_name) $ '
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# directories
hash -d doc=~/Documents
hash -d dow=~/Downloads

#UPM
hash -d upm=~/OneDrive/UPM/
hash -d upm1=~/OneDrive/UPM/primero_informatica_upm/
hash -d upm2=~/OneDrive/UPM/segundo_informatica_upm/
hash -d upm3=~/OneDrive/UPM/tercero_informatica_upm/
hash -d upm4=~/OneDrive/UPM/cuarto_informatica/

#scripts
export PATH=$PATH:~/scripts
export PATH=$PATH:/usr/local/bsvc/bin

alias horario="horario.sh"

# git
function acp() {
  git add .
  git commit -m "$1"
  git push
}

# extract most known formats
function extract()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.tar.xz)    tar xvf $1      ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# neo-vim
alias vi='nvim'
alias :q='exit'

# shutdown, suspend
alias sdown='shutdown now'
alias spend='systemctl suspend -i'
