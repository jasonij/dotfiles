## Welcome to my zshrc

# oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
ZSH_TMUX_AUTOCONNECT=false
ZSH_TMUX_AUTOQUIT=false
ZSH_TMUX_AUTOSTART=true

# Python
DISABLE_VENV_CD=1

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

plugins=(
# SLOW:
# aws # this one is just awful
# pyenv
# rbenv
# virtualenvwrapper
brew
bundler
colorize
colorized-man-pages
gem
git
lein
osx
pylint
python
ruby
sbt
scala
tmux
)

fpath=(/usr/local/share/zsh-completions $fpath)

### Directories
alias bbtlp="cd $HOME/workplace/BigBirdThrottleLogProcessor"
alias bbtlps="cd $HOME/workplace/BigBirdThrottleLogProcessor/src/BigBirdThrottleLogProcessor"
alias bun="cd $HOME/.config/nvim/bundle"
alias dot="cd ~/dotfiles"
alias misc="cd $HOME/Code/misc"
alias not="cd $HOME/notes"
alias notes="cd $HOME/notes"
alias prog="cd $HOME/Code/scala/progfun1"
alias rep="cd $HOME/repos/"
alias space="cd $HOME/.emacs.d"
alias tp="cd $HOME/third-party"
alias wk="cd $HOME/workplace"

### Emacs
if [ -n "$INSIDE_EMACS" ]
then
  ZSH_TMUX_AUTOSTART=false
  unsetopt zle
fi

# alias e='emacsclient -t'
# alias ec='emacsclient -c'
alias e="emacs -Q -nw"
alias realias="alias | sed -E \"s/^alias ([^=]+)='(.*)'$/alias \1 \2 \$*/g; s/'\\\''/'/g;\" > ~/.emacs.d/.cache/eshell/new_alias"
alias newrealis="alias | sed -E \"s/^(.*)='?(.*)/alias \1 \2/\" | sed -E \"s/'$//\" > ~/.emacs.d/.cache/eshell/alias"

### Java
export MAVEN_OPTS="-Xmx2g -XX:ReservedCodeCacheSize=512m"
# To enable shims and autocompletion add to your profile:
# if which jenv > /dev/null; then eval "$(jenv init -)"; fi

### Neovim
alias n="nvim"
alias nv="nvim"
alias nvd="nvim ~/TODO.md"
alias nve="nvim ~/.zshenv"
alias nvn="nvim notes.md"
alias nvt="nvim ~/dotfiles/.tmux.conf"
alias nvv="nvim ~/dotfiles/init.vim"
alias nvz="nvim ~/dotfiles/.zshrc"
alias v="nvim"

### Scala
alias sbaa="sbt \~assembly"
alias sbca="sbt clean assembly"
alias sbcc="sbt \~compile"
alias sbec="jenv exec sbt ensimeConfig"
alias sbq="sbt test-quick"
alias sbqq="sbt \~test-quick"
alias sbs="sbt scalastyle"
alias sbss="sbt \~scalastyle"
alias sbxx="sbt \~test"

### Tags
alias tag="/usr/local/bin/ctags --exclude=@$HOME/.ctagsignore -RV ."

### Tmux
alias tlp="tmux list-panes"

### Neovim
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# NOTE: Put environment-specific things in ~/.zshenv which is unique per environment
#       and should probably not be included at all in my dotfiles

### Oh My Zsh
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
