" if you cannot give it a name, is it really a concept you understand?
"
" TODO:
" Fix the C-h backspace issue but not here
" Fix the junk characters issue with escape too (that can go here)

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

if has('nvim')

  NeoBundle 'Shougo/neocomplcache.vim'

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
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

  " For cursor moving in insert mode(Not recommended)
  "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
  "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
  "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
  "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
  " Or set this.
  "let g:neocomplcache_enable_cursor_hold_i = 1
  " Or set this.
  "let g:neocomplcache_enable_insert_char_pre = 1

  " AutoComplPop like behavior.
  "let g:neocomplcache_enable_auto_select = 1

  " Shell like behavior(not recommended).
  "set completeopt+=longest
  "let g:neocomplcache_enable_auto_select = 1
  "let g:neocomplcache_disable_auto_complete = 1
  "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

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

  """ END neocomplcache
  """""""""""""""""""""

else

  NeoBundle 'Shougo/neocomplete.vim'
  """""""""""""""
  """ neocomplete

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
  let g:neocomplete#sources#omni#input_patterns.scala = '\%(\h\w*\|)\)\.\w*'

  """ END neocomplete
  """""""""""""""""""

endif

NeoBundle 'JuliaLang/julia-vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'benmills/vimux'
NeoBundle 'bling/vim-airline'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'chriskempson/base16-vim'
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
NeoBundle 'majutsushi/tagbar'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/ScrollColors'
NeoBundle 'vim-scripts/Vim-R-plugin'
NeoBundle 'wellle/tmux-complete.vim'

call neobundle#end()
filetype plugin indent on     " required
NeoBundleCheck

""" END NeoBundle
"""""""""""""""""


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

nnoremap <space>b :Unite buffer bookmark<cr>
nnoremap <space>l :Unite tmuxcomplete/lines<cr>
nnoremap <space>t :Unite tmuxcomplete<cr>
nnoremap <space>y :Unite history/yank<cr>

call unite#custom#source('file,file/new,buffer,file_rec', 'matchers', 'matcher_fuzzy')
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

""" END Unite.vim
"""""""""""""""""

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
let g:pymode_lint_on_write = 1
let g:pymode_lint_python_checkers = ['flake8', 'mccabe', 'pep257', 'pep8', 'pyflakes', 'pylama', 'pylint', 'python']
let g:pymode_lint_unmodified = 1
let g:pymode_options_max_line_length = 99
let g:scala_first_party_namespaces='com\.socrata\.\(cetera\|phiddipides\).*'
let g:scala_sort_across_groups=1
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
let g:slime_paste_file = tempname()
let g:slime_python_ipython = 1
let g:slime_target = "tmux"
let g:solarized_contrast="high"
let g:solarized_termcolors = 256
let g:solarized_termtrans = 1
let g:tagbar_width = 45
let g:tmuxcomplete#trigger = 'omnifunc'
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_folding_disabled=1
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimrplugin_underscore = 0

set backupdir=~/.vim/backup
set cmdheight=1
set directory=~/.vim/swap,.
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

set wildignore=*.class,*.cache,target,project/target,project/project,project/boot,project/plugins/project/,tags,vcr_cassettes,__pycache__,*.pyc

""" we need a way to set wildignore based on project type. e.g., ignore bin in scala but not in python


""" for the vim r-plugin
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine


""" essential
noremap ; :
noremap : ;


" Override that obnoxious bar in pymode
au FileType python setlocal textwidth=0


" Pymode sometimes doesn't run lint on save
au BufWriteCmd *.py write || :PymodeLint


""" Work around a bug in NeoVim (C-h remap is broken)
if has('nvim')
  nmap <BS> <C-h>
endif


""" select the colorscheme here
set background=dark
let base16colorspace=256
colorscheme base16-default
