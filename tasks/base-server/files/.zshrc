export ZSH="$HOME/.oh-my-zsh"

# auto update omz without confirmation
zstyle ':omz:update' mode auto

# omz frequency
zstyle ':omz:update' frequency 7

# disable auto title in terminals and prompts
DISABLE_AUTO_TITLE=true

# avoiding duplicates in history
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
DISABLE_UPDATE_PROMPT="true"
ZSH_THEME="xiong-chiamiov-plus"
plugins=(git sudo colorize colored-man-pages zsh-autosuggestions)
source /home/morty/.oh-my-zsh/oh-my-zsh.sh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/home/morty/.local/bin:$PATH"%
alias tq="clear && /usr/bin/bash /home/morty/tq.sh"
alias tp="clear && /usr/bin/bash /home/morty/tp.sh"
alias update="clear && sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y"
alias f2bss="sudo docker exec -it fail2ban fail2ban-client status sshd"
alias f2br="sudo docker exec -it fail2ban fail2ban-client restart"