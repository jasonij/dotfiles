## Welcome to my zshrc

# oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
ZSH_TMUX_AUTOCONNECT=false
ZSH_TMUX_AUTOQUIT=false
ZSH_TMUX_AUTOSTART=true

# Don't rename tmux windows automatically
DISABLE_AUTO_TITLE="true"

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

plugins=(
# aws  # this is slow so only enable when you're using it, which is all the time I suppose
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
virtualenv
)

fpath=(/usr/local/share/zsh-completions $fpath)

### Directories

# Where I'm working the most often
# (set in .zshenv)
alias src="cd $SRC_DIR"

alias bun="cd $HOME/.config/nvim/bundle"
alias dot="cd ~/dotfiles"
alias hn="hostname"
alias misc="cd $HOME/Code/misc"
alias not="cd $HOME/notes"
alias notes="cd $HOME/notes"
alias nv="cd $HOME/third-party/neovim"
alias prog="cd $HOME/Code/scala/progfun1"
alias rep="cd $HOME/repos/"
alias space="cd $HOME/.emacs.d"
alias tp="cd $HOME/third-party"
alias wk="cd $HOME/workspaces"

### Base16
# BASE16_SHELL=$HOME/.config/base16-shell/
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

### Ctags
alias tag="ctags --exclude=@$HOME/.ctagsignore -R -f tags"
alias etag=tag -e

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

# Git
alias fetch_all="ls -d */ | xargs -P12 -I{} git -C {} fetch --all --prune"
alias gall='ls -d */ | xargs -P12 -I{} git -C {} '
alias pull_all="ls -d */ | xargs -P12 -I{} git -C {} pull"

### Java
export MAVEN_OPTS="-Xmx2g -XX:ReservedCodeCacheSize=512m"
# To enable shims and autocompletion add to your profile:
# if which jenv > /dev/null; then eval "$(jenv init -)"; fi

### Neovim
alias v="nvim"
alias vd="nvim ~/Notes/TODO.md"
alias ve="nvim ~/.zshenv"
alias vn="nvim notes.md"
alias vq="nvim ~/Notes/QUESTIONS.md"
alias vr="nvim ~/Notes/RETRO.md"
alias vs="nvim ~/Notes/SCRUM.md"
alias vt="nvim ~/dotfiles/.tmux.conf"
alias vv="nvim ~/dotfiles/init.vim"
alias vz="nvim ~/dotfiles/.zshrc"

export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

export EDITOR=nvim

### Python
# export DISABLE_VENV_CD=1
# export WORKON_HOME=~/Envs

# WARN: this may not work on linux
# NOTE: Also, you might prefer just using local venvs and a system Python
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
source /usr/local/bin/virtualenvwrapper_lazy.sh

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

### Tmux
alias tlp="tmux list-panes"

compctl -g '~/.teamocil/*(:t:r)' teamocil

### z is the new j, yo
. `brew --prefix`/etc/profile.d/z.sh


# NOTE: Put environment-specific things in ~/.zshenv which is unique per environment
#       and should probably not be included at all in my dotfiles

# TODO: Add reference-branch to zshenv and Gdiff use that, defaulting to master if unset
# Is there some analog to unimpaired for the console? e.g., jumping through sibling directories


### Oh My Zsh
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export PATH="/Users/jkroll/anaconda2/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH=$HOME/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

