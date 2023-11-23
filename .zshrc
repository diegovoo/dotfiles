# Path to your oh-my-zsh installation.
  export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# ZSH_THEME="pixegami-agnoster"
# ZSH_THEME="random"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# on init and first instance only
# Check if there is exactly one 'zsh' process running
if [ $(ps -A | grep -c 'zsh') -eq 2 ]; then # 2 because it just works xd, when u run "ps -A | grep -c 'zsh'" the output is 1 
# echo "
#            .         .                                                                    
#           ,8.       ,8.           8 8888 8888888 8888888888 8 8888      88    d888888o.   
#          ,888.     ,888.          8 8888       8 8888       8 8888      88  .\`8888:' \`88. 
#         .\`8888.   .\`8888.         8 8888       8 8888       8 8888      88  8.\`8888.   Y8 
#        ,8.\`8888. ,8.\`8888.        8 8888       8 8888       8 8888      88  \`8.\`8888.     
#       ,8'8.\`8888,8^8.\`8888.       8 8888       8 8888       8 8888      88   \`8.\`8888.    
#      ,8' \`8.\`8888' \`8.\`8888.      8 8888       8 8888       8 8888      88    \`8.\`8888.   
#     ,8'   \`8.\`88'   \`8.\`8888.     8 8888       8 8888       8 8888      88     \`8.\`8888.  
#    ,8'     \`8.\`'     \`8.\`8888.    8 8888       8 8888       \` 8888     ,8P 8b   \`8.\`8888. 
#   ,8'       \`8        \`8.\`8888.   8 8888       8 8888         8888   ,d8P  \`8b.  ;8.\`8888 
#  ,8'         \`         \`8.\`8888.  8 8888       8 8888          \`Y88888P'    \`Y8888P ,88P' 
# "

neofetch
fi

# god prompt
#export PS1=$'\n[%1~] $ '

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

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# uni -> modelsym and stuff
export PATH=$PATH:/home/m1tus/snap/intelFPGA_lite/20.1/modelsim_ase/bin

#directories
# hash table is a much better approach than alias (only works on zsh)
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

#html shortcuts
#alias fmoodle="firefox https://moodle.upm.es/titulaciones/oficiales/my/ &"
#alias fsisdis="firefox https://moodle.upm.es/titulaciones/oficiales/course/view.php?id=20288 &" #not working

# clear
#alias claer="clear"
#alias clera="clear"

# git
function acp() {
  git add .
  git commit -m "$1"
  git push
}

# neo-vim
alias vi='nvim'

# shutdown, suspend
alias sdown='shutdown now'
alias spend='systemctl suspend -i'

# servers autoconnect
alias sshhome='ssh m1tus@81.41.169.170'

# alias sshtriqui='ssh d.vigneron@triqui1.fi.upm.es'
