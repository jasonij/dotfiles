"""""""""""""""""""
""" BEGIN NeoBundle

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
end

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'benmills/vimux'
NeoBundle 'bling/vim-airline'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'derekwyatt/vim-sbt'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'elzr/vim-json'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'godlygeek/csapprox'
NeoBundle 'godlygeek/tabular'
NeoBundle 'jimenezrick/vimerl'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'klen/python-mode'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'plasticboy/vim-markdown'
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

"""""""""""""""
""" neocomplete

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.java =  '\%(\h\w*\|)\)\.\w*'
"let g:neocomplete#sources#omni#input_patterns.scala = '\%(\h\w*\|)\)\.\w*'

""" END neocomplete
"""""""""""""""""""

"""""""""""""
""" Unite.vim

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column --hidden'
  let g:unite_source_grep_recursive_opt = ''
endif

let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'

nnoremap <space>f :Unite file_rec/async<cr>
nnoremap <space>g :Unite grep:.<cr>
nnoremap <space>b :Unite buffer<cr>
nnoremap <space>y :Unite history/yank<cr>

call unite#custom#profile('files', 'filters', ['sorter_rank'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#filters#matcher_default#use([
      \ 'matcher_fuzzy',
      \ 'matcher_hide_hidden_files',
      \ 'matcher_project_ignore_files'
      \ ])

""" END Unite.vim
"""""""""""""""""


let g:EclimCompletionMethod = 'omnifunc'
let g:EclimPythonValidate = 0
let g:EclimRubyValidate = 0
"let g:EclimScalaValidate = 0
"
let g:syntastic_enable_elixir_checker = 1 " Disabled by default for security
let g:syntastic_exilir_checkers = ["elixir"]
let g:syntastic_python_checkers = [] " TODO only disable if pymode is running
let g:syntastic_scala_checkers  = [] " TODO only disable if Eclim is running

let g:syntastic_html_tidy_ignore_errors = [
      \"trimming empty <i>",
      \"trimming empty <span>",
      \"<input> proprietary attribute \"autocomplete\"",
      \"proprietary attribute \"role\"",
      \"proprietary attribute \"hidden\"",
      \]

let g:NERDTreeWinSize = 35
let g:SuperTabDefaultCompletionType = 'context'
let g:acp_enableAtStartup = 0
let g:haddock_browser = "firefox"
let g:netrw_altv = 1
let g:netrw_browse_split = 4
let g:netrw_liststyle=3
let g:pymode_lint_on_write = 1
let g:pymode_lint_python_checkers = ['flake8', 'mccabe', 'pep257', 'pep8', 'pyflakes', 'pylama', 'pylint', 'python']
let g:pymode_lint_unmodified = 1
let g:pymode_options_max_line_length = 99
let g:scala_sort_across_groups = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
let g:slime_paste_file = tempname()
let g:slime_python_ipython = 1
let g:slime_target = "tmux"
let g:solarized_termcolors = 256
let g:solarized_termtrans = 1
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_folding_disabled=1
let g:vimrplugin_underscore = 0

set backupdir=~/.vim/backup
set cmdheight=2
set directory=~/.vim/swap,.
set expandtab
set grepprg=ag
set guifont=Inconsolata\ 13
set guioptions=0
set hidden
set list
set number
set relativenumber
set shell=/bin/zsh
set shiftwidth=2
set t_Co=256
set tabstop=2
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000

set wildignore=*.class,*.cache,target,project,tags,vcr_cassettes,__pycache__,*.pyc

""" we need a way to set wildignore based on project type. e.g., ignore bin in
""" scala but not in python


""" for the vim r-plugin
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine


""" essential
noremap ; :
noremap : ;


""" filetypes
"au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
"au! BufNewFile,BufRead *.r,*.R setfiletype r


" Override that obnoxious bar in pymode
au FileType python setlocal textwidth=0
au BufWriteCmd *.py write || :PymodeLint


""" Open NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


""" set up a highlight bar for current line
" augroup CursorLine
"   au!
"   au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"   au WinLeave,FocusLost * setlocal nocursorline
" augroup END

" autocmd ColorScheme * hi CursorLine cterm=NONE ctermbg=black


""" select the colorscheme here
set background=dark
colorscheme zenburn
