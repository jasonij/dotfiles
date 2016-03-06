" Vim is a player's racquet
"
" C-h broken? See https://github.com/neovim/neovim/issues/2048
"
" TODO:
" Go between tests and instances in Scala
" M-s-< and M-s->
" NERDTree ignores my ignores on the first opening
" leader mappings for available prefixes (a, h (git gutter uses me), m, j, k, i, o, p, z) and non-alpha!
" <leader><leader><char> for easy motion to character
" What I'd really like is <leader><leader>key for bidirectional hop to key
" What about a splitting version of C-] ?
" When I delete a buffer, the window shouldn't close, instead the next buffer
" can I get tmux paste to trigger paste mode in neovim?
" d-J and d-K for column seek delete? make orthogonal?
" leader combo for delete current buffer and swap to previous
" Get NeoMake listing next and previous to work (they aren't relative to cursor position)
" Space may not be the best leader key, possibly ; is.
" (SPC and \) or (; and ,) make more sense as leader/localleader combos
" But (; and ,) requires intelligent on/off of streak mode or whatever it is
" Let's try , as localleader too, see which mappings make sense
" How to get spelling suggestions to show up?
" Let's try to get C-hjkl back, I like C-h (maybe just in tmux)
" The violin approach -- multiple shortcuts for the same actions
" Gdiff should have $BASE, $LOCAL, $REMOTE, $MERGED or something like that
" What about ;; and ,, for next and prev? Or bail on those as leaders
" Need to get NeoMake to respect my style rules for Ruby & Scala
" Open from Unite into vsplit or hsplit windows
" Use _ as a word separator line -? Is Emacs and shell-compatible
" gggqG (is there something shorter?)
" Possibly C-w = after NeoTree open
" gf should support the usual master, origin, merged, etc.
" S-Cmd or S-M -> and < for top and bottom?
" hotkey to regenerate tags
" should we make Unite grep do a source grep?
" get scalastyle from neomake to read from local config file (or global or whatever)
" How to get :unite whatever-was-my-last-unite-thing
" Use :unite line and those sorts of things (good hotkey)
" Unite recent files?
"
" Let's think about autocomplete. It's not often optimal:
" * built-in C-n and C-p are very useful when programming
" * C-x C-o for ensime and some others
" * deoplete but maybe not by default
"
" I'm used to <leader>-ESC for QA but is it actually a good idea?
" - Not necessarily, I often do <leader>-ESC when I want to get out of leader
"
" Smart-case with vim-sneak? Does it exist?
"
" messages from ensime stay up for like 1 second. How can I change this?
"
" Essential ruby regex: s/:\(\w\+\)=>/\1: /g


"""""""""""""
""" NeoBundle

set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.config/nvim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" C/C++
NeoBundle 'justmao945/vim-clang'

" Clojure
NeoBundle 'guns/vim-clojure-highlight'
NeoBundle 'guns/vim-sexp'
NeoBundle 'luochen1990/rainbow'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-sexp-mappings-for-regular-people'

" Data Formats
NeoBundle 'cespare/vim-toml'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'elzr/vim-json'
"doc collision on ]u is just too annoying
"NeoBundle 'plasticboy/vim-markdown'

" Elixir
NeoBundle 'awetzel/elixir.nvim', { 'build': { 'mac' : 'yes | ./install.sh', 'unix' : 'yes | ./install.sh' } }
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'jimenezrick/vimerl'
NeoBundle 'thinca/vim-ref'

" Git
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive', { 'augroup' : 'fugitive' }

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
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'

" Scala
NeoBundle 'derekwyatt/vim-sbt'
NeoBundle 'derekwyatt/vim-scala'
"NeoBundle 'ensime/ensime-vim'

" Tmux
NeoBundle 'benmills/vimux'
NeoBundle 'christoomey/vim-tmux-navigator'

" Disabled until tmuxline has true color support
"NeoBundle 'edkolev/tmuxline.vim'

NeoBundle 'jpalardy/vim-slime'
NeoBundle 'wellle/tmux-complete.vim'

" Vim

"" tpope
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-rsi.git'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-vinegar'

"" Shougo
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'Shougo/echodoc.vim'
NeoBundle 'Shougo/neoinclude.vim'
NeoBundle 'Shougo/neopairs.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neoyank.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {'build' : {'mac' : 'make -f make_mac.mak', 'unix' : 'make -f make_unix.mak'}}

"" et al
NeoBundle 'Konfekt/FastFold'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'benekastah/neomake'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'junegunn/fzf'
NeoBundle 'junegunn/fzf.vim'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree', { 'augroup' : 'NERDTreeHijackNetrw' }
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'vim-scripts/ScrollColors'

call neobundle#end()
filetype plugin indent on

NeoBundleCheck


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

let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1


""" we need a way to set wildignore based on project type. e.g., ignore bin in scala but not in python
set wildignore=*.class,*.cache,.chef,target/,project/target/,project/project,project/boot,project/plugins/project/,tags,vcr_cassettes,__pycache__,*.pyc,*.ipynb,.ensime_cache/,node_modules/,bower_components/,dev-server/,bower/
call unite#custom#source('file_rec,file_rec/async,file_rec/neovim,file_rec/neovim2', 'ignore_globs', split(&wildignore, ','))
call unite#custom#source('grep', 'matchers', 'matcher_fuzzy')
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_selecta'])


"""""""
""" let

"let base16colorspace=256

let g:NERDTreeWinSize=45

let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16'

let g:deoplete#auto_completion_start_length = 3
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.java = '[^. *\t]\.\w*'
let g:deoplete#omni#input_patterns.ruby = ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::']

let g:haddock_browser = "firefox"
let g:haddock_docdir="/usr/local/share/doc/ghc/html/"

"let g:neomake_scala_enabled_makers = ['fsc', 'scalastyle']

" netrw is buggy stop using it
" wait, did neovim fix it? no, not yet.
let g:netrw_altv = 1
let g:netrw_browse_split = 4
let g:netrw_liststyle=3

" pymode should not use global leader, omg srsly.
let g:pymode_breakpoint_bind = '<localleader>b'
let g:pymode_folding = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_python_checkers = [ 'pylint', 'pep257', 'pep8', 'pyflakes', 'mccabe' ]
let g:pymode_lint_unmodified = 1
let g:pymode_options_max_line_length = 99
let g:pymode_rope = 0
let g:pymode_run_bind = '<localleader>r'

let g:python3_host_prog = 'python3'

let g:rainbow_active = 1

let g:scala_first_party_namespaces='.*\(cetera\|phidippides\|rammstein\).*'
let g:scala_sort_across_groups=1
let g:scala_use_builtin_tagbar_defs = 0

let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
let g:slime_paste_file = tempname()
let g:slime_python_ipython = 1
let g:slime_target = "tmux"

let g:sneak#streak = 1

let g:VimuxRunnerIndex = 2

"replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

"replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

"let g:tagbar_width = 45
"let g:tagbar_sort = 0

let g:vim_json_syntax_conceal = 0
let g:vim_markdown_folding_disabled = 1


"""""""
""" set

" Remember to mkdir -p ~/.config/nvim/backup ~/.config/nvim/swap ~/.config/nvim/undo
set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/swap
set undodir=~/.config/nvim/undo

" TODO: many of these are probbaly in sensible.vim so remove them here or drop
" sensible instead.
set cmdheight=1
set cursorline
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
"set t_Co=256
set tabstop=2
set tags=.tags;
set textwidth=100
set undofile
set undolevels=1000
set undoreload=10000


""""""""""""""""
""" MAPPINGS!!!!
"
" Inspired by Spacemacs, but semantically vimmish

" Leaders
let mapleader=" "
let maplocalleader="\\"
nmap , <localleader>
nmap <leader>m <localleader>

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

" Windows (see if you like these or want those keys back)
nnoremap <leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <leader>= <C-w>=
nnoremap <leader>o :only<cr>
nnoremap <leader>s :split<cr>
nnoremap <leader>sp :split<cr>
nnoremap <leader>ss :split<cr>
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>vs :vsplit<cr>
nnoremap <leader>vv :vsplit<cr>

nnoremap <C-S-}> :sp <CR>:exec("tag ".expand("<cword>"))<CR>

" Edit Files
nnoremap <leader>ed :e ~/notes/TODO.md<cr>
nnoremap <leader>em :e ~/notes/menu.md<cr>
nnoremap <leader>en :e notes.md<cr>
nnoremap <leader>er :e ~/notes/RETRO_NOTES.md<cr>
nnoremap <leader>et :e ~/dotfiles/.tmux.conf<cr>
nnoremap <leader>ev :e ~/dotfiles/init.vim<cr>
nnoremap <leader>ez :e ~/.zshrc<cr>

" Consider: <leader> for ~/<file> and <localleader> for ./<file>
nnoremap <leader>sd :sp ~/notes/TODO.md<cr>
nnoremap <leader>sm :sp ~/notes/menu.md<cr>
nnoremap <leader>sn :sp notes.md<cr>
nnoremap <leader>sr :sp ~/notes/RETRO_NOTES.md<cr>
nnoremap <leader>st :sp ~/dotfiles/.tmux.conf<cr>
nnoremap <leader>sv :sp ~/dotfiles/init.vim<cr>
nnoremap <leader>sz :sp ~/.zshrc<cr>

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
" Look out gitgutter uses leader h for hunks
nnoremap <leader>* :UniteWithCursorWord grep/git:.<cr>
nnoremap <leader># :UniteWithCursorWord grep/.:.<cr>
nnoremap <leader>/ :Unite grep/git:.<cr>
nnoremap <leader>? :Unite grep:.<cr>
nnoremap <leader>hh :let @/ = ""<cr>

" Terminal!
" <leader>' for :terminal ?
tnoremap <Esc> <C-\><C-n>

" Toggles
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>t :TagbarToggle<CR>

" Unite
" TODO: define a [unite] prefix and roll from there
" Also, don't duplicate the u and shortcut mappings
" Keep an eye on neovim-specific file_recs, now are slower but could get faster
nnoremap <leader>u :Unite 
nnoremap <leader>ub :Unite buffer bookmark<cr>
nnoremap <leader>uf :Unite file<cr>
nnoremap <leader>ug :Unite grep:.<cr>
nnoremap <leader>ul :Unite tmuxcomplete/lines<cr>
nnoremap <leader>ur :Unite file_rec/git<cr>
nnoremap <leader>uR :Unite file_rec/async<cr>
nnoremap <leader>ut :Unite tmuxcomplete<cr>
nnoremap <leader>uy :Unite history/yank<cr>

" Unite shortcuts
nnoremap <leader>b :Unite buffer bookmark<cr>
nnoremap <leader>l :Unite tmuxcomplete/lines<cr>
nnoremap <leader>f :Unite file<cr>
nnoremap <leader>r :Unite file_rec/git<cr>
nnoremap <leader>R :Unite file_rec/async<cr>
nnoremap <leader>y :Unite history/yank<cr>

" Vimux
nnoremap <leader>vi :VimuxInspectRunner<CR>
nnoremap <leader>vl :VimuxRunLastCommand<CR>
nnoremap <leader>vp :VimuxPromptCommand<CR>
nnoremap <leader>vq :VimuxCloseRunner<CR>
nnoremap <leader>vr :VimuxRunCommand ''<left>
nnoremap <leader>vx :VimuxInterruptRunner<CR>
nnoremap <leader>vz :call VimuxZoomRunner()<CR>

function! VimuxSlime()
 call VimuxSendText(@v)
 call VimuxSendKeys("Enter")
endfunction

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <leader>vs "vy :call VimuxSlime()<CR>

" Select current paragraph and send it to tmux
nmap <leader>vs vip<leader>vs<CR>


"""""""""""
""" autocmd

" .md is more often markdown than modula-2
au BufNewFile,BufReadPost *.md set filetype=markdown

" Override that obnoxious bar in pymode
au FileType python setlocal textwidth=0

" OS X and crontabs. moan. sigh. groan.
autocmd filetype crontab setlocal nobackup nowritebackup

" Neomake
autocmd! BufWritePost * Neomake


"""""""""""""""
""" colorscheme

set background=light
colorscheme base16-atelierdune
