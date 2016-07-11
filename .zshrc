## TODO

# and work out a shareable zshrc
#
# accommodate iterm2 (single) and urxvt (multiple) patterns
# figure out some clever env way around base16 color themes
# we need a dark/light switcher
# sed 's/^set background=light$/set background=dark/' ~/dotfiles/init.vim
#
# Dawg you gotta use push pop more often it's just faster
#
# Alias: How to cd .. until we reach a git repo?

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
ZSH_TMUX_AUTOCONNECT=false
ZSH_TMUX_AUTOQUIT=false
ZSH_TMUX_AUTOSTART=true

# virtualenvwrapper tries to switch env based on project
DISABLE_VENV_CD=1

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

# DISABLE_AUTO_TITLE="true"

if [ -n "$INSIDE_EMACS" ]
then
  ZSH_TMUX_AUTOSTART=false
  unsetopt zle
fi

plugins=(aws brew bundler gem git lein python rails rake rbenv ruby sbt scala tmux tmuxinator virtualenvwrapper osx)

fpath=(/usr/local/share/zsh-completions $fpath)

# TODO do these belong here?
# cd shortcuts
# change these to fancy zsh format aliases?

alias blog="cd $HOME/blog"

alias bun="cd $HOME/.config/nvim/bundle"
alias cass=cas

alias dot="cd ~/dotfiles"
alias ens="cd $HOME/Code/third-party/ensime-server"
alias hack="cd $HOME/Code/hackweek"
alias lane="cd $HOME/Code/lane"

alias logs="tail -f /usr/local/var/postgres/pg_log/postgresql.log"
alias meta=met
alias misc="cd $HOME/Code/misc"
alias ml=animl
alias notes="cd $HOME/notes"

alias pal="cd $HOME/Code/misc/ruby/palindrome"


alias ramm=ram


alias space="cd $HOME/.emacs.d"

alias sta=stack
alias tp="cd $HOME/Code/third-party"

### Command shortcuts
alias b2d="boot2docker"

alias e='emacsclient -t'
alias ec='emacsclient -c'

alias gbdm="git branch --merged | grep -v \* | xargs git branch -d"

alias gdm="git difftool master"
alias gdo="git difftool origin"
alias gfp="git fetch --prune"
alias grh1="git reset HEAD~1"

alias nv="nvim"
alias nvd="nvim ~/notes/TODO.md"
alias nvn="nvim notes.md"
alias nvo="nvim ~/ON_CALL_HOW_TO_NOTES.md"
alias nvr="nvim ~/notes/RETRO_NOTES.md"
alias nvt="nvim ~/dotfiles/.tmux.conf"
alias nvv="nvim ~/dotfiles/init.vim"
alias nvz="nvim ~/.zshrc"

alias sbaa="sbt \~assembly"
alias sbca="sbt clean assembly"
alias sbcc="sbt \~compile"
alias sbge="jenv exec sbt gen-ensime"
alias sbgem="jenv exec sbt gen-ensime-meta"
alias sbgep="jenv exec sbt gen-ensime-project"
alias sbq="sbt test-quick"
alias sbqq="sbt \~test-quick"
alias sbs="sbt scalastyle"
alias sbss="sbt \~scalastyle"
alias sbxx="sbt \~test"

alias tag="/usr/local/bin/ctags --exclude=@$HOME/.ctagsignore -RV ."
alias tlp="tmux list-panes"

### For Emacs
alias realias="alias | sed -E \"s/^alias ([^=]+)='(.*)'$/alias \1 \2 \$*/g; s/'\\\''/'/g;\" > ~/.emacs.d/.cache/eshell/new_alias"
alias newrealis="alias | sed -E \"s/^(.*)='?(.*)/alias \1 \2/\" | sed -E \"s/'$//\" > ~/.emacs.d/.cache/eshell/alias"

### Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Yay Java Environment Manager!
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# # Ruby Environment Manager
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi

# # Source Socrata configuration (I must come after rbenv)
# # TODO: figure how how to get this happening
# #source ~/.config/base16-shell/base16-default.dark.sh

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
