" Vim is a player's racquet
"
" C-h broken? See https://github.com/neovim/neovim/issues/2048
"
" TODO:
" Go between tests and instances
" can I get tmux paste to trigger paste mode in neovim?
" how integrated do I really want vim and tmux to be?
" use C-o more often
" leader mappings for available prefixes (a, h (git gutter uses me), m, j, k, i, o, p, z)
" splits often scroll in a way I don't like
" What about <leader>m as <localleader> ?
" What about a splitting version of C-] ?
" NERDTree ignores my ignores on the first opening
" How to get auto-corrections from spell checking??
" SlimeConfig may get confused with C-6
" leader combo for delete current buffer and swap to previous
" <leader>/ could analog coh
" Unite sometimes enters in paste mode, that's atrocious.
" Consider making gv come on after visual exit
"
" IDEAS: spacemacs for vim, and emacs for vim
" probably start with a few useful spacemacs keybindings (<leader>-/ for unite
" grep symbol under cursor)
" d-J and d-K for column seek delete? make orthogonal?

" NOTE: all signs point to MicroSpacemacs


""""""""""
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
NeoBundle 'guns/vim-clojure-highlight'
NeoBundle 'guns/vim-sexp'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-sexp-mappings-for-regular-people'

" Data Formats
NeoBundle 'cespare/vim-toml'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'elzr/vim-json'

" Elixir
NeoBundle 'elixir-lang/vim-elixir'
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

" R
NeoBundle 'jalvesaq/Nvim-R'

" Ruby
NeoBundle 'ngmy/vim-rubocop'
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
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {'build' : {'mac' : 'make -f make_mac.mak', 'unix' : 'make -f make_unix.mak'}}
NeoBundle 'bling/vim-airline'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-repeat'
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

""""""""""""""""""
""" neosnippet.vim

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


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

let base16colorspace=256

" spacemacs!
let mapleader=" "
let maplocalleader="\\"

let g:haddock_browser = "firefox"

" neocomplcache will freeze at 100% cpu elsewise
let g:latex_to_unicode_tab = 0

let g:latex_to_unicode_auto = 1

let g:NERDTreeWinSize=50

" netrw is buggy stop using it
" wait, did neovim fix it?
let g:netrw_altv = 1
let g:netrw_browse_split = 4
let g:netrw_liststyle=3

" pymode should not use global leader
let g:pymode_rope = 0
let g:pymode_breakpoint_bind = '<localleader>b'
let g:pymode_folding = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_python_checkers = [ 'pylint', 'pep257', 'pep8', 'pyflakes', 'mccabe' ]
let g:pymode_lint_unmodified = 1
let g:pymode_options_max_line_length = 99
let g:pymode_run_bind = '<localleader>r'

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

let g:scala_first_party_namespaces='com\.socrata\.\(cetera\|phiddipides\).*'
let g:scala_sort_across_groups=1
let g:scala_use_builtin_tagbar_defs = 0

let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
let g:slime_paste_file = tempname()
let g:slime_python_ipython = 1
let g:slime_target = "tmux"

" Try it back to normal
"let g:sneak#streak = 1

" scala has ~test and python has python-mode
let g:syntastic_mode_map = { "mode" : "active", "passive_filetypes" : ["python", "scala"] }

let g:tagbar_width = 45
let g:tagbar_sort = 0

let g:tmuxcomplete#trigger = 'omnifunc'

let g:unite_enable_start_insert = 1

let g:airline_powerline_fonts = 1
let g:vim_airline_theme = 'base16'

let g:vim_json_syntax_conceal = 0

let g:vim_markdown_folding_disabled = 1


"""""""
""" set

" Remember to mkdir -p ~/.vim/backup ~/.vim/swap ~/.vim/undo

set backupdir=~/.vim/backup
set cmdheight=1
set cursorline
set directory=~/.vim/swap
set encoding=utf-8
set expandtab
set grepprg=ag
set guioptions=0
set hidden
set list
"set number
set previewheight=17
"set relativenumber
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
set wildignore=*.class,*.cache,.chef,target,project/target,project/project,project/boot,project/plugins/project/,tags,vcr_cassettes,__pycache__,*.pyc,*.ipynb


""""""""""""""""
""" MAPPINGS!!!!
"
" Inspired by Spacemacs, but going 'viminal'
" This is creeping towards Spacemacs bindings

" Saving and Quitting
nnoremap <leader><ESC> :qa<cr>
nnoremap <leader>Q :qa<cr>
nnoremap <leader>W :wa<cr>
nnoremap <leader>X :xa<cr>
nnoremap <leader>c <c-w>c
nnoremap <leader>d :bd<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>x :x<cr>

" Edit Files
nnoremap <leader>ed :e ~/TODO.md<cr>
nnoremap <leader>em :e ~/menu.md<cr>
nnoremap <leader>en :e notes.md<cr>
nnoremap <leader>er :e ~/RETRO_NOTES.md<cr>
nnoremap <leader>et :e ~/dotfiles/.tmux.conf<cr>
nnoremap <leader>ev :e ~/dotfiles/.vimrc<cr>
nnoremap <leader>ez :e ~/.zshrc<cr>

" Files
nnoremap <leader>fS :wa<cr>
nnoremap <leader>ff :Unite file_rec/async<cr>
nnoremap <leader>fs :w<cr>
nnoremap <leader>ft :NERDTreeToggle<CR>

" Git
" Remember <leader>h_ for GitGutter
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gf :Git! diff --name-only master<CR>
nnoremap <leader>gg :copen<CR>:Ggrep 
nnoremap <leader>gh :Gdiff origin/HEAD<CR>
nnoremap <leader>gm :Gdiff master<CR>
nnoremap <leader>go :Gdiff origin<CR>
nnoremap <leader>gs :Gstatus<CR>

" Searching
nnoremap <leader>sc :let @/ = ""<cr>
nnoremap <leader>/ :UniteWithCursorWord grep:.<cr>

" Toggles
nnoremap <leader>t :TagbarToggle<CR>

" Unite
nnoremap <leader>u :Unite 
nnoremap <leader>ub :Unite buffer bookmark<cr>
nnoremap <leader>uf :Unite file<cr>
nnoremap <leader>ug :Unite grep:.<cr>
nnoremap <leader>ul :Unite tmuxcomplete/lines<cr>
nnoremap <leader>ur :Unite file_rec/async<cr>
nnoremap <leader>ut :Unite tmuxcomplete<cr>
nnoremap <leader>uy :Unite history/yank<cr>

" Unite shortcuts
nnoremap <leader>bb :Unite buffer bookmark<cr>
nnoremap <leader>l :Unite tmuxcomplete/lines<cr>
nnoremap <leader>y :Unite history/yank<cr>

" Vimux
nnoremap <leader>vi :VimuxInspectRunner<CR>
nnoremap <leader>vl :VimuxRunLastCommand<CR>
nnoremap <leader>vp :VimuxPromptCommand<CR>
nnoremap <leader>vq :VimuxCloseRunner<CR>
nnoremap <leader>vr :VimuxRunCommand ''<left>
nnoremap <leader>vx :VimuxInterruptRunner<CR>
nnoremap <leader>vz :call VimuxZoomRunner()<CR>


"""""""""""
""" autocmd

" .md is more often markdown than modula-2
au BufNewFile,BufReadPost *.md set filetype=markdown

" Override that obnoxious bar in pymode
au FileType python setlocal textwidth=0

" Open NERDTree automatically when vim starts up if no files are specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the only window left open is NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" OS X and crontabs. moan. sigh. groan.
autocmd filetype crontab setlocal nobackup nowritebackup

" rainbow_parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"""""""""""""""
""" colorscheme
set background=dark
colorscheme base16-default
