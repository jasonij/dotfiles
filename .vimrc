"""""""""""""""""""
""" BEGIN NeoBundle

if has('vim_starting')
  set nocompatible              " be iMproved, required
  set runtimepath+=~/.vim/bundle/neobundle.vim/
end

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim' " required

NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'benmills/vimux'
NeoBundle 'bling/vim-airline'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'derekwyatt/vim-sbt'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'elzr/vim-json'
NeoBundle 'ervandew/supertab'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'git://git.wincent.com/command-t'
NeoBundle 'godlygeek/csapprox'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/ScrollColors'
NeoBundle 'vim-scripts/Vim-R-plugin'

call neobundle#end()
filetype plugin indent on     " required
NeoBundleCheck

""" END NeoBundle
"""""""""""""""""

let g:EclimCompletionMethod = 'omnifunc'
let g:NERDTreeWinSize = 50
let g:SuperTabDefaultCompletionType = 'context'
let g:VimuxHeight = "25"
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:haddock_browser = "firefox"
let g:scala_sort_across_groups = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
let g:slime_paste_file = tempname()
let g:slime_python_ipython = 1
let g:slime_target = "tmux"
let g:solarized_termcolors = 256
let g:solarized_termtrans = 1
let g:syntastic_python_checkers=['flake8', 'pyflakes', 'python']
let g:syntastic_scala_checkers = [] " TODO only disable if Eclim is running
let g:vim_json_syntax_conceal = 0

let g:syntastic_html_tidy_ignore_errors = [
      \"trimming empty <i>",
      \"trimming empty <span>",
      \"<input> proprietary attribute \"autocomplete\"",
      \"proprietary attribute \"role\"",
      \"proprietary attribute \"hidden\"",
      \]

let g:tmuxline_preset = 'tmux'
let g:vimrplugin_underscore = 0


set backupdir=~/.vim/backup
set directory=~/.vim/swap,.
set expandtab
set grepprg=ag
set guioptions=0
set hidden
set list
set number
set relativenumber
set shiftwidth=2
set tabstop=2
set tags=tags;/
set t_Co=256
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000
set wildignore=*.class,*.cache,target,project,bin


" for the vim r-plugin
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" absolutely essential
noremap ; :
noremap : ;

""" vimux
map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>
map <Leader>vz :call VimuxZoomRunner()<CR>


au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au! BufNewFile,BufRead *.r,*.R setfiletype r

" Octave syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave,FocusLost * setlocal nocursorline
augroup END

set background=dark
colorscheme desert
