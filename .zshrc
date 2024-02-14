# Display neofetch on first zsh instance
# if [ $(pgrep -cx zsh) -eq 1 ]; then
# neofetch
# fi

# Find and set branch name if in git repository. (for prompt)
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

# Config for prompt
prompt=$'\n[%1~]$(git_branch_name) $ '

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Directories hash table
hash -d upm=~/OneDrive/UPM/
hash -d upm1=~/OneDrive/UPM/primero_informatica_upm/
hash -d upm2=~/OneDrive/UPM/segundo_informatica_upm/
hash -d upm3=~/OneDrive/UPM/tercero_informatica_upm/
hash -d upm4=~/OneDrive/UPM/cuarto_informatica/

# adds the whole repo, commits and pushes
function acp() {
  git add .
  git commit -m "$1"
  git push
}

# neo-vim
alias vi='nvim'
alias :q='exit'

# shutdown, suspend
alias sdown='shutdown now'
alias spend='systemctl suspend -i'
