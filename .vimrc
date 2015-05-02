" C-h broken? Try this in your home directory:
" infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
" tic $TERM.ti
"
" TODO:
"
" Fix the C-h backspace issue in urxvt, see https://github.com/neovim/neovim/issues/2048
"
" Look into vim ordering of buffers (sort by MRU for [b and ]b)
"
" Hot keys to go between tests and instances

" PythonMode to open folds by default

" can I use vimux, tslime, or tmux config to scroll the neighboring window?

" can I get tmux paste to trigger paste mode in vim?

" can I get C-tab to cycle vim windows and tmux panes?

"" use c and C-o more often

" hotkeys for sorting blocks (select bloc, sort, and return to line)

" leader mappings for s, m, etc.

" override python-mode bindings that override unite

"""""""""""
""" NeoBundle

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" C/C++
NeoBundle 'justmao945/vim-clang'

" Clojure
NeoBundle 'guns/vim-sexp'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-sexp-mappings-for-regular-people'

" Data Formats
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'elzr/vim-json'

" Elixir
NeoBundle 'elixir-lang/vim-elixir'

" Erlang
NeoBundle 'jimenezrick/vimerl'

" Git
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'

" Haskell
" See https://github.com/begriffs/haskell-vim-now
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'lukerandall/haskellmode-vim'

" JavaScript
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'pangloss/vim-javascript'

" Julia
NeoBundle 'JuliaLang/julia-vim'

" Python
NeoBundle 'klen/python-mode'

" Ruby
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'

" Scala
NeoBundle 'derekwyatt/vim-sbt'
NeoBundle 'derekwyatt/vim-scala'

" Tmux
NeoBundle 'benmills/vimux'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'wellle/tmux-complete.vim'

" Vim
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc.vim', {'build' : {'mac' : 'make -f make_mac.mak', 'unix' : 'make -f make_unix.mak'}}
NeoBundle 'bling/vim-airline'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


"""""""""""""""""
""" neocomplcache -- neovim and neocomplete are not compatible

let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"""""""""""""
""" Unite.vim

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column --hidden'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_rec_async_command= 'ag --follow --nocolor --nogroup --hidden -g ""'
endif

let g:unite_source_history_yank_enable = 1

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('grep', 'matchers', 'matcher_fuzzy')


"""""""
""" let

" spacemacs!
let mapleader=" "

" turn off rope because of a bug
let g:pymode_rope = 0

let g:haddock_browser = "firefox"

let g:netrw_altv = 1
let g:netrw_browse_split = 4
let g:netrw_liststyle=3

let g:pymode_lint_on_write = 0
let g:pymode_lint_python_checkers = [ 'pylint', 'pep257', 'pep8', 'pyflakes', 'mccabe' ]
let g:pymode_lint_unmodified = 1
let g:pymode_options_max_line_length = 99

let g:scala_first_party_namespaces='com\.socrata\.\(cetera\|phiddipides\).*'
let g:scala_sort_across_groups=1
let g:scala_use_builtin_tagbar_defs = 0

let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
let g:slime_paste_file = tempname()
let g:slime_python_ipython = 1
let g:slime_target = "tmux"

let g:sneak#streak = 1

" scala has ~test and python has python-mode
let g:syntastic_mode_map = { "mode" : "active", "passive_filetypes" : ["python", "scala"] }

let g:tagbar_width = 45

let g:tmuxcomplete#trigger = 'omnifunc'

let g:unite_enable_start_insert = 1

let g:vim_airline_theme = 'base16'

let g:vim_json_syntax_conceal = 0

let g:vim_markdown_folding_disabled = 1

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'


"""""""
""" set

set backupdir=~/.vim/backup
set cmdheight=1
set directory=~/.vim/swap
set encoding=utf-8
set expandtab
set grepprg=ag
set guioptions=0
set hidden
set list
set number
set previewheight=17
set relativenumber
set shell=zsh
set shiftwidth=2
set t_Co=256
set tabstop=2
set tags=.tags;
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000

""" we need a way to set wildignore based on project type. e.g., ignore bin in scala but not in python
set wildignore=*.class,*.cache,target,project/target,project/project,project/boot,project/plugins/project/,tags,vcr_cassettes,__pycache__,*.pyc


""""""""""""""""
""" MAPPINGS!!!!

" Single keys for native vim stuff
" Double keys for plugins

" Vim saving and quitting
nnoremap <leader><ESC> :qa<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>a :wa<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>z :xa<CR>

" Git
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>go :Gdiff origin<CR>
nnoremap <leader>gm :Gdiff master<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gg :copen<CR>:Ggrep 
nnoremap <leader>gs :Gstatus<CR>

" Unite
nnoremap <leader>u :Unite 
nnoremap <leader>ub :Unite buffer bookmark<cr>
nnoremap <leader>uf :Unite file<cr>
nnoremap <leader>ug :Unite grep:.<cr>
nnoremap <leader>ul :Unite tmuxcomplete/lines<cr>
nnoremap <leader>ur :Unite file_rec/async<cr>
nnoremap <leader>ut :Unite tmuxcomplete<cr>
nnoremap <leader>uv :VimFilerExplorer -winwidth=50<cr>
nnoremap <leader>uy :Unite history/yank<cr>

nnoremap <leader>vf :VimFilerExplorer -winwidth=50<cr>

" Vimux
noremap <leader>vi :VimuxInspectRunner<CR>
noremap <leader>vl :VimuxRunLastCommand<CR>
noremap <leader>vp :VimuxPromptCommand<CR>
noremap <leader>vq :VimuxCloseRunner<CR>
noremap <leader>vr :VimuxRunCommand ''<left>
noremap <leader>vx :VimuxInterruptRunner<CR>
noremap <leader>vz :call VimuxZoomRunner()<CR>


""" Pymode fixes
au FileType python setlocal textwidth=0  " Override that obnoxious bar in pymode
"au BufWriteCmd *.py write || :PymodeLint " Pymode sometimes doesn't run lint on save

" .md is more often markdown than modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

""" colorscheme
set cursorline
set background=light
let base16colorspace=256
colorscheme base16-solarized
