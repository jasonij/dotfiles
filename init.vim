" Vim is a player's racquet
"
" C-h broken? See https://github.com/neovim/neovim/wiki/FAQ#my-ctrl-h-mapping-doesnt-work
"
" TODO:
"
" Get NeoMake listing next and previous to work (they aren't relative to cursor position)
" (This is okay if you wrap your checkers with something like Pylama)
"
" Sort quickfix window by line number, can it be done?
"
" Can I get the quickfix window to follow my cursor position (so next is relative to cursor?)
"
" gggqG (is there something shorter?)
"
" Q: How best to store favorite regexes?
" A: Likely you'll want some leader-key bindings or named fns for common calls
" A: You could also plug this into a denite menu (possibly?)
" Essential ruby regex: s/:\(\w\+\)=>/\1: /g
" Essential python call: !python -m json.tool
"
" Can I let vim "steal" open files from other vim sessions?
" Can I then auto-update from the changed file on disk?
"
" Binding for subvert?
" Subvert more often! e.g., :'<,'>Subvert/categor{y,ies}/tag{,s}/g
" The plural case is so common maybe have a fn or hotkey around it
"
" Make use of marks! ''
"
" Copy current filename into system clipboard
" And/or Vimux start populated with filename (if possible)
"
" aucommand to change wildignore based on project type
"
" Binding for 'send this selection to tmux pane x'
"
" Can I change some visual state to indicate that leader or local leader has been pressed?
"
" Denite menu could be used for dotfile editing, etc
"
" More git diff viewers and file finders (possibly through Unite) for head~1, master, origin, etc.
"
" Can I get a jobstart that doesn't close when I close vim?
"
" Wait, do I want :Unite filelist ... :Git! diff-tree --no-commit-id --name-only -r head~1
"
" Can I get tags to show up on the vim help files?
"
" How to make .nvim-python logs go somewhere not stupid?
"
" I would like ]C and [C to go along with ]c and [c (add to git-gutter?)
"
" For Clj I'd like to use omni complete always(?)
"
" How can I get the name of the current file for the : command line?
"
" Automatically clear search highlighting after executing s/
" Unbind <leader>h bindings and use <leader>h to clear highlights
" (But what happens to the hunk bindings?)
"
" C-M-hjkl or C-HJKL for resizing panes (if vim supports this kind of resizing)
"
" Use [e and ]e instead of M-jk like in org
"
" Can I get help to open in a vertical split?
"
" Neomake could open :lw automatically if any errors are detected?

" LEARN: (in more depth)
" Python-mode (ins and outs)
" Fugitive
" Tmux itself
" Markdown (it should be an adequate org with less tapping)


""""""""
""" Plug

"" This is non-standard, because I migrated from NeoBundle
"" TODO: rename to plug or whatever is the norm or look into Shougo's new project
call plug#begin('~/.config/nvim/bundle')

" About 70 plugins, that's probably too many (right Spacemacs?)

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" C/C++
Plug 'justmao945/vim-clang'

" Clojure
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'guns/vim-sexp'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-salve'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" Data Formats
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Elixir
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
Plug 'elixir-lang/vim-elixir'
Plug 'jimenezrick/vimerl'
Plug 'thinca/vim-ref'

" Git
" NOTE: If you have to use something other that git, Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Haskell
" See https://github.com/begriffs/haskell-vim-now
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'lukerandall/haskellmode-vim'

" JavaScript is not a good language
Plug 'pangloss/vim-javascript'

" Julia
Plug 'JuliaLang/julia-vim'

" LaTeX
" remember to put `$pdflatex = 'xelatex --shell-escape %O %S';` in ~/.latexmkrc
Plug 'lervag/vimtex'

" Lua
Plug 'xolox/vim-lua-ftplugin'
Plug 'xolox/vim-lua-inspect'
Plug 'xolox/vim-misc'

" Org
Plug 'jceb/vim-orgmode'

" Python
Plug 'klen/python-mode', { 'branch': 'develop' }
Plug 'zchee/deoplete-jedi'

" R
Plug 'jalvesaq/Nvim-R'

" Ruby
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" Rust
Plug 'rust-lang/rust.vim'

" Scala
" Q: Could we get autocompletion without Ensime? It's so janky.
Plug 'derekwyatt/vim-sbt'
Plug 'derekwyatt/vim-scala'
" Plug 'ensime/ensime-vim', { 'do': function('DoRemote') }

" Tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" TODO: submit PR to tmuxline for adding optional window status?
Plug 'edkolev/tmuxline.vim'
Plug 'wellle/tmux-complete.vim'

" Vim

"" tpope misc
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

"" Shougo misc
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

"" et al
Plug 'Konfekt/FastFold'
Plug 'altercation/vim-colors-solarized'
Plug 'benekastah/neomake'
Plug 'francoiscabrol/ranger.vim'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'rbgrouleff/bclose.vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()


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


" From http://bleibinha.us/blog/2013/08/my-vim-setup-for-scala
" Wildmenu completion: use for file exclusions
set wildmenu
set wildmode=list:longest
set wildignore+=.hg/,.git/,.svn/ " Version Controls [ed: had to append /]"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"
set wildignore+=*.class "java/scala class files"
set wildignore+=*/target/* "sbt target directory"


"""""""
""" let

let g:VimuxRunnerIndex = 2

let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" TODO: Some of these copy ignorecase and smart_case, set those instead
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" see https://github.com/ensime/ensime-vim/pull/259
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.java = '[^. *\t]\.\w*'
let g:deoplete#omni#input_patterns.scala = '[^. *\t]\.\w*'
" let g:deoplete#omni#input_patterns.ruby = ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::']

let g:deoplete#omni#input_patterns.tex =
      \ '\v\\%('
      \ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
      \ . '|hyperref\s*\[[^]]*'
      \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|%(include%(only)?|input)\s*\{[^}]*'
      \ . '|\a*(gls|Gls|GLS)(pl)?\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . ')'

" Remember to install ag! GitGutter doesn't give you a warning if it's not there
let g:gitgutter_grep_command = 'ag --nogroup --nocolor --hidden'

let NERDTreeWinSize = 45

" pymode should not use global leader, omg srsly.
let g:pymode_breakpoint_bind = '<localleader>b'
let g:pymode_run_bind = '<localleader>r'
let g:pymode_options_max_line_length = 99
" that obnoxious bar can be turned off!
let g:pymode_options_colorcolumn = 0

" Legacy codebases have too many whitespaces
let g:pymode_trim_whitespaces = 0

" Neomake runs pylama
let g:pymode_lint = 0
" let g:neomake_python_enabled_makers = ['isort', 'mccabe', 'pep257', 'pep8', 'pycodestyle', 'pydocstyle', 'pyflakes']

let g:python_host_prog = '/Users/jkroll/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/jkroll/.pyenv/versions/neovim3/bin/python'

" Rainbow parens don't work well with light colorschemes
let g:rainbow_active = 0

let g:ranger_map_keys = 0

let g:scala_first_party_namespaces='.*\(cetera\|phidippides\|procrustes\|rammstein\|\unobtanium\).*'
let g:scala_sort_across_groups=1
let g:scala_use_builtin_tagbar_defs = 0

let g:tmux_navigator_save_on_switch = 1

let g:tmuxline_powerline_separators = 1
let g:tmuxline_preset = 'powerline'


""""""""
" Tagbar

" let g:tagbar_sort = 0
let g:tagbar_autofocus = 1

let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records'
    \ ]
\ }

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }

let g:tagbar_type_ruby = {
    \ 'ctagstype' : 'ruby',
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \ ]
\ }

let g:tagbar_type_scala = {
    \ 'ctagstype' : 'scala',
    \ 'sro'       : '.',
    \ 'kinds'     : [
      \ 'p:packages',
      \ 'T:types:1',
      \ 't:traits',
      \ 'o:objects',
      \ 'O:case objects',
      \ 'c:classes',
      \ 'C:case classes',
      \ 'm:methods',
      \ 'V:values:1',
      \ 'v:variables:1'
    \ ]
\ }

let g:undotree_SplitWidth = 40

let g:vim_markdown_conceal = 0
" let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1

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

let g:vim_json_syntax_conceal = 0


"""""""
""" set

" mkdir -p ~/.config/nvim/backup ~/.config/nvim/swap ~/.config/nvim/undo
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
set nolazyredraw
set number
set previewheight=17
set relativenumber
set shell=zsh
set shiftwidth=2
set t_Co=256
set tabstop=2
set tags=./tags;
set textwidth=100
set undofile
set undolevels=1000
set undoreload=10000


""""""""""""
""" MAPPINGS
""" Inspired by Spacemacs, but semantically vimmish

" Leaders
" This way, you can use , as local leader and still have , work for reverse last command
" NOTE: This may no longer be necessary, and it would free up \
let mapleader=" "
let maplocalleader="\\"
nmap , <localleader>


"""""
" Vim

nnoremap <leader>Q :qa<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>W :wa<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>X :xa<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>c :close<CR>
" nnoremap <leader>d :bd<CR>
nnoremap <leader>d :Bclose<CR>
nnoremap <leader>z :w<CR>:bd<CR>
nnoremap <leader>Z :xa!<CR>

nnoremap <leader>= <C-w>=
nnoremap <leader>o :only<CR>

" Why are these broken?
nnoremap <C-Tab> <C-w>w
nnoremap <C-S-Tab> <C-w>W


""""""""""
" Fugitive
"
" Remember gitgutter's <leader>h bindings
" nmap <Leader>hs <Plug>GitGutterStageHunk
" nmap <Leader>hr <Plug>GitGutterRevertHunk
" nmap <Leader>hp <Plug>GitGutterPreviewHunk

nnoremap [fugitive] <Nop>
nmap <leader>g [fugitive]

nnoremap [fugitive]a :Gcommit --amend<CR>
nnoremap [fugitive]b :Gblame<CR>
nnoremap [fugitive]B :Git branch<Space>
nnoremap [fugitive]c :Gcommit -v -q<CR>
nnoremap [fugitive]d :Gdiff origin/master<CR>
nnoremap [fugitive]e :Gedit<CR>
nnoremap [fugitive]f :Git! diff --name-only origin/master<CR>
nnoremap [fugitive]F :Git diff --name-only origin/master<CR>
nnoremap [fugitive]g :copen<CR>:Ggrep 
nnoremap [fugitive]l :silent! Glog<CR>
nnoremap [fugitive]m :Gmove<Space>
nnoremap [fugitive]o :Git checkout<Space>
nnoremap [fugitive]p :Ggrep<Space>
nnoremap [fugitive]pl :Dispatch! git pull<CR>
nnoremap [fugitive]ps :Dispatch! git push<CR>
nnoremap [fugitive]r :Gread<CR>
nnoremap [fugitive]s :Gstatus<CR>
nnoremap [fugitive]t :Gcommit -v -q %<CR>
nnoremap [fugitive]w :Gwrite<CR><CR>
nnoremap [fugitive]x :Gbrowse<CR>


""""""
" Misc


nnoremap - :Ranger<CR>

nnoremap <leader>E :NERDTreeFind<CR>
nnoremap <leader>e :NERDTreeToggle<CR>

noremap <leader>; :Commentary<CR>

" Q: How to send <Esc> inside terminal?
tnoremap <Esc> <C-\><C-n>
nnoremap <leader>' :split \| terminal<CR>

nnoremap <leader>T :call jobstart('ctags --exclude=@$HOME/.ctagsignore -RV -f tags-regenerating . && mv tags-regenerating tags')<CR>
nnoremap <leader>t :TagbarToggle<CR>

nnoremap <leader>u :UndotreeToggle<CR>

nnoremap <leader>h :let @/ = ""<CR>
nnoremap <leader>hh :let @/ = ""<CR>
" Why do I have to keep clearing highlights anyway?

nnoremap <leader>sn :sp notes.md<CR>
nnoremap <leader>sv :sp $HOME/dotfiles/init.vim<CR>


""""""""
" Denite

" Ag for file_rec
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', ''])

" Ag for grep
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['--nogroup', '--nocolor', '--column', '--hidden'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'separator', [])

" Change mappings.
call denite#custom#map('_', "\<C-j>", 'move_to_next_line')
call denite#custom#map('_', "\<C-k>", 'move_to_prev_line')
call denite#custom#map('_', "\<C-n>", 'move_to_next_line')
call denite#custom#map('_', "\<C-p>", 'move_to_prev_line')

nnoremap <leader>* :DeniteCursorWord grep<CR><CR>
nnoremap <leader>/ :Denite grep<CR>

nnoremap <leader>B :Denite buffer !<CR>
nnoremap <leader>b :Denite buffer<CR>

" TODO: Figure out these mappings (they're not consistent with the others)
nnoremap <leader>$ :Denite directory_rec<CR>
nnoremap <leader>% :DeniteCursorWord directory_rec<CR>

nnoremap <leader>F :DeniteCursorWord file_rec<CR>
nnoremap <leader>f :Denite file_rec<CR>

nnoremap <leader>K :DeniteCursorWord help<CR>
nnoremap <leader>k :Denite help<CR>

nnoremap <leader>j :Denite jump_point<CR>

nnoremap <leader>L :DeniteCursorWord line<CR>
nnoremap <leader>l :Denite line<CR>

nnoremap <leader>M :DeniteCursorWord filetype<CR>
nnoremap <leader>m :Denite filetype<CR>

" These currently make no difference
" TODO: see if there's an option to file_mru possibly
nnoremap <leader>R :Denite file_mru<CR>
nnoremap <leader>r :DeniteBufferDir file_mru<CR>

nnoremap <leader>y :Denite neoyank<CR>


"""""""
" Vimux
"
" TODO: send region, selection, line to pane n
" TODO: bind <leader>s to send

nnoremap [vimux] <Nop>
nmap <leader>v [vimux]
vmap <leader>v [vimux]

nnoremap [vimux]<leader> :let g:VimuxRunnerIndex=

" Can I get the LastCommand pre-populated from last session?
nnoremap [vimux]c :VimuxCloseRunner<CR>
nnoremap [vimux]d :VimuxScrollDownInspect<CR>
nnoremap [vimux]i :VimuxInspectRunner<CR>
nnoremap [vimux]l :VimuxRunLastCommand<CR>
nnoremap [vimux]p :VimuxPromptCommand<CR>
nnoremap [vimux]q :VimuxCloseRunner<CR>
nnoremap [vimux]r :VimuxRunCommand ''<left>
nnoremap [vimux]u :VimuxScrollUpInspect<CR>
nnoremap [vimux]x :VimuxInterruptRunner<CR>
nnoremap [vimux]z :VimuxZoomRunner<CR>

function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

vmap [vimux]s "vy :call VimuxSlime()<CR>
nmap [vimux]s vip[vimux]s<CR>


"""""""""""
""" autocmd

" OS X and crontabs. moan. sigh. groan.
autocmd filetype crontab setlocal nobackup nowritebackup

"" Neomake
autocmd! BufWritePost * Neomake

" Lua has : in keywords
augroup filetype_lua
  autocmd!
  autocmd FileType lua setlocal iskeyword+=:
augroup END

" See https://github.com/benekastah/neomake/issues/15
au FileType clojure setlocal makeprg=lein\ kibit\ %
au FileType clojure setlocal errorformat=%IAt\ %f:%l:,%C%m,%Z,%-G%.%#
let g:neomake_clojure_kibit_maker = {
      \ 'buffer_output': 1,
      \ 'exe': 'lein',
      \ 'args': ['kibit'],
      \ 'errorformat': '%IAt\ %f:%l:,%C%m,%Z,%-G%.%#',
      \ }
let g:neomake_clojure_enabled_makers = ['kibit']

" Open NERDTree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Quit if NERDTree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"""""""""""""""
""" colorscheme

set background=light
colorscheme solarized
