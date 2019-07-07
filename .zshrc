## Welcome to my zshrc

# TODO:
# Consider pairing down your oh-my-zsh aliases, like do you really need them?
#
# aliases for s, d, e, z (well, we have z anyway but could we pipe z into fzf or something?)
#
# z -l args | fzf --tac # for example for example, maybe turn off fzf sorting though

# oh-my-zsh
ZSH=$HOME/.oh-my-zsh
# ZSH_THEME="minimal"
ZSH_THEME="robbyrussell"
ZSH_TMUX_AUTOCONNECT=true
ZSH_TMUX_AUTOQUIT=false
ZSH_TMUX_AUTOSTART=false

# Don't rename tmux windows automatically
DISABLE_AUTO_TITLE="true"

# unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

# To debug:
# time zsh -i -c exit

plugins=(
# aws  # this is slow so only enable when you're using it, which is all the time I suppose
brew
bundler
cargo
colorize
colorized-man-pages
history
gem
gitfast
git-extras
lein
osx
pip
pylint
python
# rbenv  # rbenv is slow
ruby
rust
sbt
scala
tig
tmux
)

fpath=(/usr/local/share/zsh-completions $fpath)

### Alacritty
alias ssh='TERM=xterm-256color ssh'
alias tig="TERM=xterm-256color tig"
alias htop="TERM=xterm-256color htop"

### Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#   [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#   eval "$("$BASE16_SHELL/profile_helper.sh")"
export PATH="$PATH:$BASE16_SHELL/scripts/"

### Ctags
alias tag="ctags --exclude=@$HOME/.ignore -R -f tags"
alias etag="tag -e"

### Emacs
alias e='emacsclient -t'
alias ec='emacsclient -c'

### Git
alias fetch_all="ls -d */ | xargs -P12 -I{} git -C {} fetch --all --prune"
alias gall='ls -d */ | xargs -P12 -I{} git -C {} '
alias pull_all="ls -d */ | xargs -P12 -I{} git -C {} pull"
alias s='git status'

### Homebrew
export PATH="/usr/local/sbin:$PATH"

### Neovim
alias vimdiff="nvim -d"
export EDITOR=nvim

# Stop accidentally loading vim, just use \vim if you want
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

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

### Python
alias i="ipython"

# WARN: this may not work on linux
# NOTE: Also, you might prefer just using local venvs and a system Python
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

### Ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
alias p="pry"
alias r="irb"

### Scala
alias sbaa="sbt \~assembly"
alias sbca="sbt clean assembly"
alias sbcc="sbt \~compile"
alias sbq="sbt test-quick"
alias sbqq="sbt \~test-quick"
alias sbs="sbt scalastyle"
alias sbss="sbt \~scalastyle"
alias sbxx="sbt \~test"

### z is the new j, yo
. `brew --prefix`/etc/profile.d/z.sh

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH=$HOME/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

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

  # Base16 Nord
  # Author: arcticicestudio
  # local color00='#2E3440'
  # local color01='#3B4252'
  # local color02='#434C5E'
  # local color03='#4C566A'
  # local color04='#D8DEE9'
  # local color05='#E5E9F0'
  # local color06='#ECEFF4'
  # local color07='#8FBCBB'
  # local color08='#88C0D0'
  # local color09='#81A1C1'
  # local color0A='#5E81AC'
  # local color0B='#BF616A'
  # local color0C='#D08770'
  # local color0D='#EBCB8B'
  # local color0E='#A3BE8C'
  # local color0F='#B48EAD'

  # # Base16 Nord
  # export FZF_DEFAULT_OPTS="
  #   --bind 'alt-n:next-history'
  #   --bind 'alt-p:previous-history'
  #   --bind 'ctrl-n:down'
  #   --bind 'ctrl-p:up'
  #   --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  #   --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  #   --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
  # "

  # # Solarized Light color scheme for fzf
  # export FZF_DEFAULT_OPTS="
  #   --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
  #   --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
  #   --bind 'alt-n:next-history'
  #   --bind 'alt-p:previous-history'
  #   --bind 'ctrl-n:down'
  #   --bind 'ctrl-p:up'
  # "

  # # Solarized Dark color scheme for fzf
  # export FZF_DEFAULT_OPTS="
  #   --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
  #   --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
  #   --bind 'alt-n:next-history'
  #   --bind 'alt-p:previous-history'
  #   --bind 'ctrl-n:down'
  #   --bind 'ctrl-p:up'
  # "

  # No colors!
  export FZF_DEFAULT_OPTS="
    --bind 'alt-n:next-history'
    --bind 'alt-p:previous-history'
    --bind 'ctrl-n:down'
    --bind 'ctrl-p:up'
  "

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
