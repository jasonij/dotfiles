if has('vim_starting')
  set nocompatible              " be iMproved, required
  filetype off                  " required (in vundle anyway)
  set runtimepath+=~/.vim/bundle/neobundle.vim/
end

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim' " required

NeoBundle 'Shougo/unite.vim' " find out what this does
NeoBundle 'SirVer/ultisnips' " what about snipmate?
NeoBundle 'benmills/vimux'
NeoBundle 'bling/vim-airline'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'ervandew/supertab'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'git://git.wincent.com/command-t'
NeoBundle 'godlygeek/csapprox'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/Vim-R-plugin'

call neobundle#end()

filetype plugin indent on     " required

NeoBundleCheck


let g:NERDTreeWinSize = 50
let g:VimuxHeight = "25"
let g:haddock_browser = "firefox"
let g:scala_sort_across_groups=1
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
let g:slime_paste_file = tempname()
let g:slime_python_ipython = 1
let g:slime_target = "tmux"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 256
let g:solarized_termtrans = 1
let g:solarized_visibility = "high"
let g:syntastic_python_checkers=['flake8', 'pyflakes', 'python']

let g:syntastic_html_tidy_ignore_errors = [
      \"trimming empty <i>",
      \"trimming empty <span>",
      \"<input> proprietary attribute \"autocomplete\"",
      \"proprietary attribute \"role\"",
      \"proprietary attribute \"hidden\"",
      \]

let g:tmuxline_preset = 'tmux'
let g:vimrplugin_underscore = 0


" for the vim r-plugin
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" absolutely essential
noremap ; :
noremap : ;

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


""" vimux
map <LocalLeader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>
map <Leader>vz :call VimuxZoomRunner()<CR>


set background=dark
set backupdir=~/.vim/backup
set directory=~/.vim/swap,.
set expandtab
set guifont=Deja\ Vu\ Sans\ Mono\ 13
set guioptions=0
set grepprg=grep\ -Irn\ --exclude=tags
set hidden
set list
set number
set shiftwidth=2
set tabstop=2
set tags=tags;/
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000
set wildignore=*.class

au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au! BufNewFile,BufRead *.r,*.R setfiletype r

" Octave syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END

" NERDTree
autocmd vimenter * if !argc() | NERDTree | endif

" Try saving!
"autocmd BufLeave,FocusLost * silent! wall

let g:netrw_banner       = 0
let g:netrw_keepdir      = 0
let g:netrw_liststyle    = 3 " or 3
let g:netrw_sort_options = 'i'

colorscheme solarized

