dotfiles
========

These are my dotfiles.

Implicitly a list of favorites.

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
* TODO [Hammerspoon](http://www.hammerspoon.org/) (fork of mjolnir)

### Neovim plugins
I rely heavily on a few plugins:
* [denite.vim](https://github.com/Shougo/denite.nvim) a bit like helm
* [deoplete](https://github.com/Shougo/deoplete.nvim) completion
* [fugitive.vim](https://github.com/tpope/vim-fugitive) magit quality
* [vimux](https://github.com/benmills/vimux) integrates with tmux
* [NERD tree](https://github.com/scrooloose/nerdtree) Until VimFiler works with denite
    [Ed: actually, NERDTree is *really* good at what it does, given how difficult it is to emulsify
    a project drawer with split windows.]

## Languages

### Production
* [Ruby](https://www.ruby-lang.org/en/)
* [Scala](http://www.scala-lang.org/)
* [Python](https://www.python.org/)
* [Java](https://www.oracle.com/java/index.html)
* [JavaScript](https://www.destroyallsoftware.com/talks/wat)

### Hobby
* [Clojure](http://clojure.org/)
* [Elixir](http://elixir-lang.org/)
* [Lua](https://www.lua.org/)

### Stats
* [Julia](http://julialang.org/)
* [R](https://www.r-project.org/)

## Random Thoughts

Immutability is a bigger game changer than strong type systems.

Usability Essentials:
* Remap caps lock to control
* Set Mac's option to Meta

## TODO

One of these days I ought to document my thoughts on tooling.
