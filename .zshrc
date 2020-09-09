## Welcome to my zshrc

# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ys"

# Don't rename tmux windows automatically
DISABLE_AUTO_TITLE="true"

# unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

# To debug:
# time zsh -i -c exit

plugins=(
  brew
  cargo
  colorize
  history
  gem
  git
  gitfast
  python
  rbenv
  ruby
  rust
  tig
  tmux
)

source $ZSH/oh-my-zsh.sh

# fpath=(/usr/local/share/zsh-completions $fpath)

### Ctags
alias tag="ctags -R -f tags"
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
# export PATH="/usr/local/sbin:$PATH"

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
alias vn="nvim notes.md"
alias vt="nvim ~/dotfiles/.tmux.conf"
alias vv="nvim ~/dotfiles/init.vim"
alias vz="nvim ~/dotfiles/.zshrc"

### Python
alias i="ipython"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

### Ruby
alias p="pry"
alias r="irb"

### z is the new j, yo
. /usr/local/etc/profile.d/z.sh

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH=$HOME/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

### FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

# openssl is broken
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# For compilers to find openssl@1.1 you may need to set:
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

# For pkg-config to find openssl@1.1 you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

export MODIN_ENGINE=ray  # Modin will use Ray
# export MODIN_ENGINE=dask  # Modin will use Dask  -- do not use!!

# Homebrew wants this
export PATH="/usr/local/sbin:$PATH"
