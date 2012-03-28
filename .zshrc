zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' max-errors 5 numeric
zstyle :compinstall filename '/home/placek/.zshrc'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:cd:*' ignore-parents parent pwd

autoload -U compinit colors
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
setopt APPEND_HISTORY
setopt SHARE_HISTORY

alias ll='ls -alF --color'
alias la='ls -A --color'
alias l='ls -CF --color'
alias ls='ls --color'
alias b='bundle exec'
alias cukes='bundle exec cucumber --require features/step_definitions --require features/support'
alias rspec='bundle exec rspec'
alias clean='rm -f **/.*.sw[po] ; rm -f **/tags ; rm -f **/*~*'
alias ask='ack-grep -ai'

compinit && colors

setopt PROMPT_SUBST
setopt AUTO_LIST
setopt MENU_COMPLETE
setopt COMPLETE_IN_WORD
setopt CORRECT_ALL
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY
setopt extendedglob

export MY_CODE="$HOME/Projekty"
export PROMPT=$'%F{green}[%n@%m %~]%f%F{yellow}$(git_prompt)%f '
export RPROMPT=$'%F{red}$(ruby_version)%f'
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1024
export SAVEHIST=1024
export REPORTTIME=10
export EDITOR='vim'
export FIREFOX_SELENIUM_PROFILE='selenium'
export JAVA_HOME='/usr/lib/jvm/java-6-openjdk'
export PATH="$PATH:/home/placek/.android-sdk-linux/tools:$JAVA_HOME/bin:/home/placek/.eclipse/"

function precmd  { print -Pn "\e]2; %~/ \a" }
function preexec { print -Pn "\e]2; %~/ \a" }
function git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo '*'
}
function git_prompt {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ' '${ref#refs/heads/}''$(git_dirty)
}
function ruby_version {
  rvm current
}
source /etc/profile
