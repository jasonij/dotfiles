" C-h broken? Try this in your home directory:
" infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
" tic $TERM.ti
"
" TODO:
" Fix the C-h backspace issue in urxvt, see https://github.com/neovim/neovim/issues/2048
" Fix the junk characters issue with escape
" Look into more efficient/ergonomic leader/local-leader keys
" What is going on with Unite bookmarks?
" Can I use UNITE for \fs and \ft ??
" tmuxcomplete may be fighting with neocomplcache and my haskell plugins


"""""""""""""
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

" Data Formats
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'elzr/vim-json'
NeoBundle 'plasticboy/vim-markdown'

" Elixir
NeoBundle 'elixir-lang/vim-elixir'

" Erlang
NeoBundle 'jimenezrick/vimerl'

" Git
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'

" Haskell
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

" R
NeoBundle 'vim-scripts/Vim-R-plugin'

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
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc.vim', {'build' : {'mac' : 'make -f make_mac.mak', 'unix' : 'make -f make_unix.mak'}}
NeoBundle 'Shougo/vimshell'
NeoBundle 'bling/vim-airline'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'godlygeek/csapprox'
NeoBundle 'godlygeek/tabular'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'vim-scripts/ScrollColors'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


"""""""""""""""""
""" neocomplcache

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

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

nnoremap <space>f :Unite -start-insert file<cr>
nnoremap <space>r :Unite -start-insert file_rec/async<cr>

nnoremap <space>g :Unite grep:.<cr>

nnoremap <space>b :Unite buffer<cr> " bookmark
nnoremap <space>l :Unite tmuxcomplete/lines<cr>
nnoremap <space>t :Unite tmuxcomplete<cr>
nnoremap <space>y :Unite history/yank<cr>

nnoremap <space>v :VimFilerExplorer -winwidth=50<cr>

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])


"""""""
""" let

"let g:syntastic_enable_elixir_checker = 1 " Disabled by default for security
let g:syntastic_exilir_checkers = ["elixir"]
let g:syntastic_python_checkers = [] " TODO only disable if pymode is running
let g:syntastic_scala_checkers  = [] " Realistically you're going to have ~test running

let g:syntastic_html_tidy_ignore_errors = [
      \"trimming empty <i>",
      \"trimming empty <span>",
      \"<input> proprietary attribute \"autocomplete\"",
      \"proprietary attribute \"role\"",
      \"proprietary attribute \"hidden\"",
      \]

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
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
let g:slime_paste_file = tempname()
let g:slime_python_ipython = 1
let g:slime_target = "tmux"
let g:tagbar_width = 45
let g:tmuxcomplete#trigger = 'omnifunc' " ??
let g:unite_enable_start_insert = 1
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_folding_disabled=1
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimrplugin_underscore = 0


"""""""
""" set

set backupdir=~/.vim/backup
set cmdheight=1
set directory=~/.vim/swap
set expandtab
set grepprg=ag
set guifont=Inconsolata\ 13
set guioptions=0
set hidden
set list
set number
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
set previewheight=17

""" we need a way to set wildignore based on project type. e.g., ignore bin in scala but not in python
set wildignore=*.class,*.cache,target,project/target,project/project,project/boot,project/plugins/project/,tags,vcr_cassettes,__pycache__,*.pyc


""" essential
noremap ; :
noremap : ;


""" for the vim r-plugin
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine


""" Pymode fixes
au FileType python setlocal textwidth=0  " Override that obnoxious bar in pymode
"au BufWriteCmd *.py write || :PymodeLint " Pymode sometimes doesn't run lint on save


""" colorscheme
set background=dark
let base16colorspace=256
colorscheme base16-default
