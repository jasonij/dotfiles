## Welcome to my zshrc

# TODO:
# Consider pairing down your oh-my-zsh aliases, like do you really need them?
#
# aliases for s, d, e, z (well, we have z anyway but could we pipe z into fzf or something?)
#
# z -l args | fzf --tac # for example for example, maybe turn off fzf sorting though

# oh-my-zsh
ZSH=$HOME/.oh-my-zsh
# ZSH_THEME="robbyrussell"
ZSH_THEME="risto"
ZSH_TMUX_AUTOCONNECT=true
ZSH_TMUX_AUTOQUIT=false
ZSH_TMUX_AUTOSTART=false

# Don't rename tmux windows automatically
DISABLE_AUTO_TITLE="true"

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

plugins=(
# aws  # this is slow so only enable when you're using it, which is all the time I suppose
brew
# bundler
cargo
colorize
colorized-man-pages
history
gem
gitfast
git-extras
# lein
osx
pip
pylint
python
ruby
rust
sbt
scala
tig
tmux
virtualenv
wd
)

fpath=(/usr/local/share/zsh-completions $fpath)

### Directories

# Where I'm working the most often
# (set in .zshenv)
alias src="cd $SRC_DIR"

alias plg="cd ~/.local/share/nvim/plugged"
alias dot="cd ~/dotfiles"
alias hn="hostname"
alias misc="cd $HOME/Code/misc"
alias not="cd $HOME/notes"
alias notes="cd $HOME/notes"
alias nv="cd $HOME/third-party/neovim"
alias prog="cd $HOME/Code/scala/progfun1"
alias rep="cd $HOME/repos/"
alias sp="cd $HOME/.pyenv/versions/3.6.4/lib/python3.6/site-packages/"
alias space="cd $HOME/.emacs.d"
alias tp="cd $HOME/third-party"
alias wk="cd $HOME/workspaces"

# ### Base16
export BASE16_SHELL=$HOME/.config/base16-shell/
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
export PATH="$BASE16_SHELL/scripts:$PATH"

### Gruvbox
# source ~/.local/share/nvim/plugged/gruvbox/gruvbox_256palette.sh

### Ctags
alias tag="ctags --exclude=@$HOME/.ignore -R -f tags"
alias etag="tag -e"

### Emacs
if [ -n "$INSIDE_EMACS" ]
then
  ZSH_TMUX_AUTOSTART=false
  unsetopt zle
fi

alias realias="alias | sed -E \"s/^alias ([^=]+)='(.*)'$/alias \1 \2 \$*/g; s/'\\\''/'/g;\" > ~/.emacs.d/.cache/eshell/new_alias"
alias newrealias="alias | sed -E \"s/^(.*)='?(.*)/alias \1 \2/\" | sed -E \"s/'$//\" > ~/.emacs.d/.cache/eshell/alias"

alias e="emacs -nw -Q"

export GTAGSLABEL=pygments

### Exa
# alias e='exa -alH --git'

# Git
alias fetch_all="ls -d */ | xargs -P12 -I{} git -C {} fetch --all --prune"
alias gall='ls -d */ | xargs -P12 -I{} git -C {} '
alias pull_all="ls -d */ | xargs -P12 -I{} git -C {} pull"
alias s='git status'

### Java
export MAVEN_OPTS="-Xmx2g -XX:ReservedCodeCacheSize=512m"
# To enable shims and autocompletion add to your profile:
# if which jenv > /dev/null; then eval "$(jenv init -)"; fi

### Neovim
alias v="nvim"
alias va="nvim ~/.config/alacritty/alacritty.yml"
alias vd="nvim ~/Notes/TODO.md"
alias ve="nvim ~/.zshenv"
alias vm="nvim ~/Notes/MACHINE-LEARNING.md"
alias vn="nvim notes.md"
alias vo="nvim ~/Notes/ONCALL.md"
alias vq="nvim ~/Notes/QUESTIONS.md"
alias vr="nvim ~/Notes/RETRO.md"
alias vs="nvim ~/Notes/SCRUM.md"
alias vt="nvim ~/dotfiles/.tmux.conf"
alias vv="nvim ~/dotfiles/init.vim"
alias vz="nvim ~/dotfiles/.zshrc"

export EDITOR=nvim

### Python
# export DISABLE_VENV_CD=1
# export WORKON_HOME=~/Envs
alias i="ipython"

# WARN: this may not work on linux
# NOTE: Also, you might prefer just using local venvs and a system Python
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
source /usr/local/bin/virtualenvwrapper_lazy.sh

### Ruby
alias p="pry"

### Scala
alias sbaa="sbt \~assembly"
alias sbca="sbt clean assembly"
alias sbcc="sbt \~compile"
alias sbq="sbt test-quick"
alias sbqq="sbt \~test-quick"
alias sbs="sbt scalastyle"
alias sbss="sbt \~scalastyle"
alias sbxx="sbt \~test"

### Tmux
alias tlp="tmux list-panes"
alias tsd="tmux new-session -d -t"

compctl -g '~/.teamocil/*(:t:r)' teamocil

### z is the new j, yo
. `brew --prefix`/etc/profile.d/z.sh

# Come up with something to make this work
# alias zf="z | fzf --tac"

# NOTE: Put environment-specific things in ~/.zshenv which is unique per environment
#       and should probably not be included at all in my dotfiles

# TODO: Add reference-branch to zshenv and Gdiff use that, defaulting to master if unset
# Is there some analog to unimpaired for the console? e.g., jumping through sibling directories

### Oh My Zsh
source $ZSH/oh-my-zsh.sh

### FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

_gen_fzf_default_opts() {
  # solarized colors
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  # https://github.com/nicodebo/base16-fzf/blob/master/bash/base16-gruvbox-dark-medium.config
  local color00='#282828'
  local color01='#3c3836'
  local color02='#504945'
  local color03='#665c54'
  local color04='#bdae93'
  local color05='#d5c4a1'
  local color06='#ebdbb2'
  local color07='#fbf1c7'
  local color08='#fb4934'
  local color09='#fe8019'
  local color0A='#fabd2f'
  local color0B='#b8bb26'
  local color0C='#8ec07c'
  local color0D='#83a598'
  local color0E='#d3869b'
  local color0F='#d65d0e'

  # # From https://github.com/nicodebo/base16-fzf/blob/master/bash/base16-gruvbox-light-medium.config
  # local color00='#fbf1c7'
  # local color01='#ebdbb2'
  # local color02='#d5c4a1'
  # local color03='#bdae93'
  # local color04='#665c54'
  # local color05='#504945'
  # local color06='#3c3836'
  # local color07='#282828'
  # local color08='#9d0006'
  # local color09='#af3a03'
  # local color0A='#b57614'
  # local color0B='#79740e'
  # local color0C='#427b58'
  # local color0D='#076678'
  # local color0E='#8f3f71'
  # local color0F='#d65d0e'

  # TODO: Factor out the color and/or keybinding opts

  # Solarized Dark color scheme for fzf
  export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
    --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
    --bind 'alt-n:next-history'
    --bind 'alt-p:previous-history'
    --bind 'ctrl-n:down'
    --bind 'ctrl-p:up'
  "

  # # Solarized Light color scheme for fzf
  # export FZF_DEFAULT_OPTS="
  #   --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
  #   --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
  #   --bind 'alt-n:next-history'
  #   --bind 'alt-p:previous-history'
  #   --bind 'ctrl-n:down'
  #   --bind 'ctrl-p:up'
  # "

  # # Gruvbox
  # export FZF_DEFAULT_OPTS="
  #   --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  #   --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  #   --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
  #   --bind 'alt-n:next-history'
  #   --bind 'alt-p:previous-history'
  #   --bind 'ctrl-n:down'
  #   --bind 'ctrl-p:up'
  # "

  # # No colors!
  # export FZF_DEFAULT_OPTS="
  #   --bind 'alt-n:next-history'
  #   --bind 'alt-p:previous-history'
  #   --bind 'ctrl-n:down'
  #   --bind 'ctrl-p:up'
  # "

  # use ripgrep
  # export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,build,node_modules}/*" 2> /dev/null'
  export FZF_DEFAULT_COMMAND='rg --files --no-ignore --follow -g "!{.git,build,node_modules}/*" 2> /dev/null'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

  # To get history working in the shell
  export FZF_CTRL_T_OPTS="--history=$HOME/.local/share/fzf-history/shell-history-files"
  export FZF_CTRL_R_OPTS="--history=$HOME/.local/share/fzf-history/shell-history-commands"
  export FZF_ALT_C_OPTS="--history=$HOME/.local/share/fzf-history/shell-history-directories"
  export FZF_COMPLETION_OPTS="--history=$HOME/.local/share/fzf-history/shell-history-completion"
}
_gen_fzf_default_opts

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH=$HOME/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src
