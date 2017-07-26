dotfiles
========

These are my dotfiles.

## Installation Notes
* .zshenv should be copied, not symlinked. It's too environment-sensitive.
* most of the other things you can symlink `ln -s ~/dotfiles/<filename> ~/<filename` or however
* TODO: use [GNU Stow](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)

## Components
* [Spacemacs](https://github.com/syl20bnr/spacemacs)
* [Neovim](https://neovim.io/)
* [tmux](https://tmux.github.io/)
* [Zsh](http://www.zsh.org/)

If on Linux:
* [Arch Linux](https://www.archlinux.org/)
* [xmonad](http://xmonad.org/)
* [urxvt](http://rxvt.sourceforge.net/) (the one true terminal)

If on Mac:
* [Homebrew](http://brew.sh/)
* [iTerm2](https://www.iterm2.com/)
* [Spectacle](https://www.spectacleapp.com/)

### Neovim plugins
Spacemacs is often slightly broken. In Neovim, I rely heavily on a few plugins:
* [denite.vim](https://github.com/Shougo/denite.nvim) a bit like helm
* [fzf.vim](https://github.com/junegunn/fzf.vim) a bit like ivy
* [deoplete](https://github.com/Shougo/deoplete.nvim) completion
* [fugitive.vim](https://github.com/tpope/vim-fugitive) magit quality
* [vimux](https://github.com/benmills/vimux) integrates with tmux
* [NERD tree](https://github.com/scrooloose/nerdtree) *really* good at what it does

## Languages
In the ML world, it's all Python and Scala now. (Well, some jokers use C++ but not me.)

### Production
* [Python](https://www.python.org/)
* [Scala](http://www.scala-lang.org/)

### Hobby (These are really my favorites)
* [Ruby](https://www.ruby-lang.org/en/)
* [Clojure](http://clojure.org/)

### Stats
* [Julia](http://julialang.org/)
* [R](https://www.r-project.org/)

### Out-of-cache
* [Elixir](https://elixir-lang.org/)
* [Haskell](https://www.haskell.org/)
* [Idris](https://www.idris-lang.org/)
* [Rust](https://www.rust-lang.org/)

## Random Thoughts
Immutability >> strong type systems.

Usability Essentials:
* Remap caps lock to control
* Set Mac's option to Meta

## TODO
One of these days I ought to document my thoughts on tooling.
