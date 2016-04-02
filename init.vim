" Vim is a player's racquet
"
" C-h broken? See https://github.com/neovim/neovim/issues/2048
"
" TODO:
" Go between tests and instances in Scala (really any langauge, right?)
" NERDTree ignores my ignores on the first opening
" leader mappings for available prefixes (a, h (git gutter uses me), m, j, k, i, o, p, z) and non-alpha!
" <leader><leader><char> for easy motion to character
" What I'd really like is <leader><leader>key for bidirectional hop to key
" What about a splitting version of C-] ?
" When I delete a buffer, the window shouldn't close, instead the next buffer
" d-J and d-K for column seek delete? make orthogonal?
" Get NeoMake listing next and previous to work (they aren't relative to cursor position)
" Let's try , as localleader too, see which mappings make sense
" How to get spelling suggestions to show up?
" Gdiff should have $BASE, $LOCAL, $REMOTE, $MERGED or something like that
" Open from Unite into vsplit or hsplit windows
" gggqG (is there something shorter?)
" gf should support the usual master, origin, merged, etc.
" S-Cmd or S-M -> and < for top and bottom?
" hotkey to regenerate tags
" should we make Unite grep do a source grep?
" How to get :unite whatever-was-my-last-unite-thing
" More :Unite hotkeys (line, recent files, split)
" Unite recent files?
" Figure out an 80-column version of gq for comments
"
" I'm used to <leader>-ESC for QA but is it actually a good idea?
" - Not necessarily, I often do <leader>-ESC when I want to get out of leader
"
" Smart-case with vim-sneak? Does it exist?
"
" messages from ensime stay up for like 1 second. How can I change this?
"
" Q: How best to store favorite regexes?
" Essential ruby regex: s/:\(\w\+\)=>/\1: /g
" Essential python call: !python -m json.tool
"
" Go back to the double-layer tags (tags for local, dep_tags or something for deps)
" Re-gen locals with hotkey but regen deps should probably be manual or shell alias
" (can depend on language)
"
" sbt-ctags should NOT tag my source tree, only tag deps
"
" How to point Vimux to a pane in another tmux session?
"
" Populate Unite with test files automatically
"
" Remember to change from Plug to Shougo's new one whatever it's called
"
" Get "open in split" working for Unite


""""""""
""" Plug

"" This is non-standard, because I migrated from NeoBundle
call plug#begin('~/.config/nvim/bundle')

" About 70 plugins, that's probably too many

" C/C++
Plug 'justmao945/vim-clang'

" Clojure
" salve?
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'guns/vim-sexp'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }

" Data Formats
Plug 'cespare/vim-toml'
Plug 'chrisbra/csv.vim'
Plug 'elzr/vim-json'

" Elixir
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
Plug 'elixir-lang/vim-elixir'
Plug 'jimenezrick/vimerl'
Plug 'thinca/vim-ref'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Haskell
" See https://github.com/begriffs/haskell-vim-now
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'lukerandall/haskellmode-vim'

" JavaScript
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'

" Julia
Plug 'JuliaLang/julia-vim'

" Python
Plug 'klen/python-mode'

" R
Plug 'jalvesaq/Nvim-R'

" Ruby
Plug 'sunaku/vim-ruby-minitest'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" Scala
" Q: Could we get autocompletion without Ensime? It's so janky.
Plug 'derekwyatt/vim-sbt'
Plug 'derekwyatt/vim-scala'

" Tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" TODO: submit PR to tmuxline for adding optional window status?
Plug 'edkolev/tmuxline.vim'

Plug 'jpalardy/vim-slime'
Plug 'wellle/tmux-complete.vim'

" Vim

"" tpope misc
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

"" Shougo misc
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

"" et al
Plug 'Konfekt/FastFold'
Plug 'benekastah/neomake'
Plug 'chriskempson/base16-vim'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tsukkee/unite-tag'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

filetype plugin indent on
syntax enable


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

let base16colorspace=256

let g:NERDTreeWinSize=45

let g:VimuxRunnerIndex = 2

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

let g:scala_first_party_namespaces='.*\(cetera\|phidippides\|procrustes\|rammstein\).*'
let g:scala_sort_across_groups=1
let g:scala_use_builtin_tagbar_defs = 0

let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
let g:slime_paste_file = tempname()
let g:slime_python_ipython = 1
let g:slime_target = "tmux"

"let g:sneak#streak = 1

""replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

""replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

"let g:tagbar_width = 45
"let g:tagbar_sort = 0

let g:vim_json_syntax_conceal = 0


"""""""
""" set

" Remember to mkdir -p ~/.config/nvim/backup ~/.config/nvim/swap ~/.config/nvim/undo
set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/swap
set undodir=~/.config/nvim/undo

" TODO: some of these are likely defaults in Neovim, so let's see what we can remove
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
set t_Co=256
set tabstop=2
set tags=tags,.tags;
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

" Windows
nnoremap <leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <leader>= <C-w>=
nnoremap <leader>o :only<cr>
nnoremap <leader>ss :split<cr>
nnoremap <leader>vv :vsplit<cr>

" Split open tag
nnoremap <C-S-}> :sp <CR>:exec("tag ".expand("<cword>"))<CR>

" Edit Files
" TODO: Think about a Unite environment, Unite project docs, etc.
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

" External Calls
nnoremap <leader>T :call jobstart('/usr/local/bin/ctags --exclude=@/Users/jasonkroll/.ctagsignore -RV .')<cr>

" Git
" Remember <leader>h_ for GitGutter
" Consider <leader>gd_ for different sources
" Maybe leave CR off of destructive cmds
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gf :Git! diff --name-only master<CR>
nnoremap <leader>gg :copen<CR>:Ggrep 
nnoremap <leader>gh :Gdiff origin/HEAD<CR>
nnoremap <leader>gm :Gdiff master<CR>
nnoremap <leader>go :Gdiff origin<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gx :Gbrowse<CR>

" Searching
" Look out gitgutter uses leader h for hunks
" You need a non-cursorword unite tags shortcut
" Try l and w for lines and word, then t is free for tags
" These belong in Unite section maybe?
nnoremap <leader># :UniteWithCursorWord grep/.:.<cr>
nnoremap <leader>* :UniteWithCursorWord grep/git:.<cr>
nnoremap <leader>. :UniteWithCursorWord tag:/^.:.<cr>
nnoremap <leader>/ :Unite grep/git:.<cr>
nnoremap <leader>? :Unite grep:.<cr>
nnoremap <leader>] :UniteWithCursorWord tag:/^.:.<cr>
nnoremap <leader>hh :let @/ = ""<cr>
nnoremap <leader>t :Unite tag<cr>

" Terminal!
" <leader>' for :terminal ?
tnoremap <Esc> <C-\><C-n>
nnoremap <leader>' :split \| terminal<CR>

" Toggles
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>t :TagbarToggle<CR>

" Unite
" TODO: define a [unite] prefix and roll from there
" Also, don't duplicate the u and shortcut mappings
" Keep an eye on neovim-specific file_recs, now are slower but could get faster
"nnoremap <leader>u :Unite 

nnoremap [unite] <Nop>
nmap <leader>u [unite]

nnoremap [unite]<leader> :Unite 
nnoremap [unite]b :Unite buffer bookmark<cr>
nnoremap [unite]f :Unite file<cr>
nnoremap [unite]R :Unite file_rec/async<cr>
nnoremap [unite]r :Unite file_rec/git<cr>
nnoremap [unite]g :Unite grep:.<cr>
nnoremap [unite]y :Unite history/yank<cr>
nnoremap [unite]t :Unite tmuxcomplete<cr>
nnoremap [unite]l :Unite tmuxcomplete/lines<cr>

" Unite shortcuts
nnoremap <leader>b :Unite buffer bookmark<cr>
nnoremap <leader>l :Unite tmuxcomplete/lines<cr>
nnoremap <leader>f :Unite file<cr>
nnoremap <leader>r :Unite file_rec/git<cr>
nnoremap <leader>R :Unite file_rec/async<cr>
nnoremap <leader>y :Unite history/yank<cr>
nnoremap <leader>a :Unite file_rec/git -input=

" Unite splits -- why don't these work?
inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')

" Vimux

nnoremap [vimux] <Nop>
nmap <leader>v [vimux]

nnoremap [vimux]i :VimuxInspectRunner<CR>
nnoremap [vimux]l :VimuxRunLastCommand<CR>
nnoremap [vimux]p :VimuxPromptCommand<CR>
nnoremap [vimux]q :VimuxCloseRunner<CR>
nnoremap [vimux]r :VimuxRunCommand ''<left>
nnoremap [vimux]x :VimuxInterruptRunner<CR>
nnoremap [vimux]z :call VimuxZoomRunner()<CR>

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
