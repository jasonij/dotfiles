" Vim is a player's racquet
"
" TODO:
"
" Get NeoMake listing next and previous to work (they aren't relative to cursor position)
" Can I get the quickfix window to follow my cursor position (so next is relative to cursor?)
"
" gggqG (is there something shorter?)
"
" Subvert more often! e.g., :'<,'>Subvert/categor{y,ies}/tag{,s}/g
"
" Make use of marks! ''
"
" Shortcut Copy current filename into system clipboard (it's already in register %)
" A: There should be a command string \"%p will paste it, but to clipboard?
"
" autocommand to change wildignore based on project type
"
" Need some kind of `gdt` or `gdt HEAD` shortcut (ideally in fugitive)
"
" I would like ]C and [C to go along with ]c and [c (add to git-gutter?)
"
" Can I get help to open in a vertical split instead of horizontal?
"
" Look into g:tmuxcomplete#capture_args and g:tmuxcomplete#list_args
"
" Tagbar for YAML files? (Works for fzf and denite but not tagbar, why?)
"
" What can I do about tagging methods inside of bin/ scripts without extensions?
"
" TODO: Make sure we make this Neovim and Vim8 compatible
"
" Q: Can I highlight the lines that changed in the last commit (or change to file) without seeing a diff?
" A: let g:gitgutter_diff_base = '<commit SHA>' ???
"
" Can I get auto-center on jumps, like zz after any jump?
"
" vip and %cpaste on like M-ret or S-ret or C-ret or something like that
"
" Try to get :History to start populated with the current project's directory
"
" I'd like ]* and [* and possibly ]# and [# for last and first search matches
"
" How can I get C-r C-w working in Terminal? Very useful for FZF et al
"
" I'd like to get the filename for grepping without the path attached (see who includes it)
"
" ]e and [e don't work with visual selection or repeats
"
" C-s like Swiper (haha, yeah right)
" Readline C-s and C-r are incredibly useful! Can we port something analogous?
" I'd really like FZF line to include cursor position (like Swiper)
" M-< and M-> for FZF (and possibly M-, and M-.)
"
" I really want a list of files touched in the last n commits
"
" I need bindings for :cw and :lw because I type them sooo often
"
" Q: What's the command for 'last-buffer-visited' ?
" A: b# (because # is last buffer visited)
"
" fzf-vim docs have typo line 125 the spaces are non-standard so copy paste fails
"
" Do you want to set auto update for git files rather than .py files? Or just have a toggle?
" Possibly <leader>a/A for autosave toggling?
"
" Can I gq with textwidth 80 even when default is textwidth 100?
"
" Set up a visual selection vimux sender with %cpaste out front for ipython


""""""""
""" Plug

"" This is non-standard, because I migrated from NeoBundle
"" TODO: rename to plug or whatever is the norm or look into Shougo's new project
let g:plug_shallow = 0  " No shallow clones!
call plug#begin('~/.local/share/nvim/plugged')

" Almost 90 plugins, that's probably too many (right Spacemacs?)

" C
Plug 'justmao945/vim-clang'

" Clojure
Plug 'clojure-vim/async-clj-omni', { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'guns/vim-sexp'
Plug 'luochen1990/rainbow'
Plug 'snoe/clj-refactor.nvim', { 'for': 'clojure' }
Plug 'tpope/vim-classpath', { 'for': 'clojue' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-salve', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" Data Formats
Plug 'cespare/vim-toml'
Plug 'chrisbra/csv.vim'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'tmux-plugins/vim-tmux'

" Git
" If you must use something other that git, Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'
Plug 'jonas/tig'
Plug 'tpope/vim-fugitive'

" Haskell
" See https://github.com/begriffs/haskell-vim-now or possibly just use emacs
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'lukerandall/haskellmode-vim', { 'for': 'haskell' }

" Julia
Plug 'JuliaLang/julia-vim'  " this is borked if you try { 'for': 'julia' }

" LaTeX
Plug 'lervag/vimtex'  " put `$pdflatex = 'xelatex --shell-escape %O %S';` in ~/.latexmkrc

" Python
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }

" R
Plug 'jalvesaq/Nvim-R', { 'for': 'r'}

" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }

" Scala
Plug 'derekwyatt/vim-sbt', { 'for': 'scala' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

" Tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'

" BUG: Tmux-complete overwrites the tmux copy paste buffer with a full-pane text grab
" REPRO: Copy something reasonable into tmux buffer, paste it in vim, then trigger tmux-complete,
" and now try pasting from the tmux buffer.
" Plug 'wellle/tmux-complete.vim'

" Vim

"" tpope misc
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

"" Shougo misc
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/denite.nvim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

"" et al
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Konfekt/FastFold'
" Plug 'Xuyuanp/nerdtree-git-plugin'  " disable until Alactritty supports glyphs
Plug 'altercation/vim-colors-solarized'
Plug 'benekastah/neomake'
Plug 'chriskempson/base16-vim'
Plug 'flazz/vim-colorschemes'
Plug 'francoiscabrol/ranger.vim'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'kassio/neoterm'
Plug 'lifepillar/vim-solarized8'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'raimondi/delimitmate'
Plug 'rbgrouleff/bclose.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/BufOnly.vim'

call plug#end()


"""""""""
""" calls

" Neomake  (100 ms is short, don't use this on laptop battery power)
call neomake#configure#automake('nw', 100)
" let g:neomake_open_list = 2
let g:neomake_logfile = '/tmp/neomake.log'


""""""""""""""""""
""" neosnippet.vim

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.config/nvim/bundle/vim-snippets/snippets'

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

" Sketchy conveniences for given projects, so remember to purge these
set wildignore+=.log,.json,.csv,.tsv,.sql,.gz


"""""""
""" let

let g:VimuxRunnerIndex = 2

" TODO: Some of these copy ignorecase and smart_case, set those instead
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" See https://github.com/clojure-vim/async-clj-omni
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

let g:deoplete#omni#input_patterns = {}

" TODO: re-evaluate approach to supporting Scala in Neovim
" see https://github.com/ensime/ensime-vim/pull/259
" let g:deoplete#omni#input_patterns.java = '[^. *\t]\.\w*'
" let g:deoplete#omni#input_patterns.scala = '[^. *\t]\.\w*'
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

let g:deoplete#sources = {}
" Q: What makes this so much faster than default {}?
" TODO: Add tmux-complete if it ever works again
let g:deoplete#sources._ = ['around', 'buffer', 'dictionary', 'file', 'member', 'tag', 'neosnippet']
let g:deoplete#sources.python = ['buffer', 'file', 'member', 'jedi', 'neosnippet', 'tag']

let g:deoplete#sources#jedi#show_docstring = 0

let g:deoplete#sources#rust#racer_binary='/Users/jkroll/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/jkroll/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'

let g:NERDTreeWinSize = 60

let g:neoterm_repl_ruby = 'pry'

" Without this, rainbow won't even load in the first place
let g:rainbow_active = 1

let g:python_host_prog = '/Users/jkroll/.pyenv/versions/2.7.12/bin/python'
let g:python3_host_prog = '/Users/jkroll/.pyenv/versions/3.6.2/bin/python'

let g:ranger_map_keys = 0

let g:SimpylFold_fold_import = 0

let g:scala_sort_across_groups=1
let g:scala_use_builtin_tagbar_defs = 0

let g:solarized_term_italics = 1

let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = 'full'

let g:vimtex_fold_enabled = 1

""""""""
" Tagbar
" NOTE: Keep an eye on universal-ctags; it may eventually add support for these

let g:tagbar_sort = 0  " sort by order rather than name

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

let g:undotree_SplitWidth = 40

let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_style_pythonic = 1

""" Sneak

let g:sneak#label = 1

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

set autoread
set autowriteall

" mkdir -p ~/.config/nvim/backup ~/.config/nvim/swap ~/.config/nvim/undo
set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/swap
set undodir=~/.config/nvim/undo

if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    let g:ackprg = 'rg --vimgrep --no-heading'
endif

" Some of these are likely defaults in Neovim, so let's see what we can remove
set completeopt-=preview
set cursorline
set encoding=utf-8
set expandtab
set hidden
set list
set nolazyredraw
set noshowcmd
set noshowmode
set previewheight=20
set shell=zsh
set shiftwidth=2
set shortmess+=c
set t_Co=256
set tabstop=2
set tags=./tags;
set termguicolors
set textwidth=100
set undofile
set undolevels=1000
set undoreload=10000


""""""""""""
""" MAPPINGS
""" Inspired by Spacemacs, but semantically vimmish
""" HEURISTIC: <leader><key> =~ the command I use most that begins with <key> or sometimes C-w<key>

" Leaders
let g:mapleader=' '
let g:maplocalleader=','


"""""
" Vim

nnoremap <leader>= <C-w>=
nnoremap <leader>o :only<CR>
nnoremap <leader>O :BufOnly<CR>
nnoremap <C-w>O :BufOnly<CR>

" Q: What about <leader>a/A ? What makes sense, Abolish, Ag?

" Q: Should Bclose possibly live here? If not, what else?
" nnoremap <leader>C :Bclose<CR>
nnoremap <leader>C :Colors<CR>
nnoremap <leader>c :close<CR>

nnoremap <leader>D :Bclose<CR>
nnoremap <leader>d :bd<CR>

nnoremap <leader>Q :qa<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader>W :wa<CR>
nnoremap <leader>w :w<CR>

nnoremap <leader>X :xa<CR>
nnoremap <leader>x :x<CR>

nnoremap <leader>Z :w<CR>:Bclose<CR>
nnoremap <leader>z :w<CR>:bd<CR>

" Why are these broken? Because iTerm2
nnoremap <C-Tab> <C-w>w
nnoremap <C-S-Tab> <C-w>W

nnoremap <leader><C-w> :Windows<CR>

nnoremap <C-w>* <C-w><C-s>*
nnoremap <C-w># <C-w><C-s>#

" Q: What about C-; for consistency w/ tmux?


""""""""
" Denite

" This is actually for deoplete but you know gotta put it somewhere
" Not sure what I did this for or why we wouldn't want sorter_rank selecta
call deoplete#custom#set('_', 'sorters', ['sorter_word'])

" Ag for file_rec
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Pants
nnoremap <C-s> :Denite line<CR>

" Ripgrep command on grep source (awesome!)
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" file_mru takes some work to make it project-specific
call denite#custom#source('file_mru', 'converters', ['converter_relative_word'])
call denite#custom#source('file_mru', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])

call denite#custom#alias('source', 'file_mru/all', 'file_mru')
call denite#custom#source('file_mru/all', 'converters', ['converter_relative_word'])
call denite#custom#source('file_mru/all', 'matchers', ['matcher_fuzzy'])

" Emacs / readline bindings
call denite#custom#map('insert', '<C-g>', '<denite:quit>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<M-n>', '<denite:assign_next_text>')
call denite#custom#map('insert', '<M-p>', '<denite:assign_previous_text>')

nnoremap <leader>B :Denite buffer:!<CR>
nnoremap <leader>K :DeniteCursorWord help<CR>
nnoremap <leader>R :Denite file_mru<CR>
nnoremap <leader>Y :DeniteCursorWord neoyank<CR>
nnoremap <leader>y :Denite neoyank<CR>


""""""""""
" Fugitive
"
" Remember gitgutter's <leader>h bindings
" nmap <Leader>hs <Plug>GitGutterStageHunk
" nmap <Leader>hu <Plug>GitGutterUndoHunk
" nmap <Leader>hp <Plug>GitGutterPreviewHunk
nnoremap <leader>ht <Plug>GitGutterLineHighlightsToggle

nnoremap [fugitive] <Nop>
nmap <leader>g [fugitive]

nnoremap [fugitive]a :Gcommit --amend<CR>
nnoremap [fugitive]b :Gblame<CR>
nnoremap [fugitive]B :Git branch<Space>
nnoremap [fugitive]c :Gcommit -v -q<CR>
nnoremap [fugitive]d :Gdiff<CR>
nnoremap [fugitive]e :Gedit<CR>
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

nnoremap <leader>$ :Ranger<CR>
nnoremap _ :Ranger<CR>

nnoremap <leader>E :NERDTreeFind<CR>
nnoremap <leader>e :NERDTreeToggle<CR>

" Is this a problem with tmux?
noremap <leader>; :Commentary<CR>

" Q: How to send <Esc> inside terminal?
" tnoremap <Esc> <C-\><C-n>
" Q: possibly ' is better for marks?
nnoremap <leader>' :split \| terminal<CR>

nnoremap <leader>T :call jobstart("ctags --exclude=@$HOME/.ignore -R -f tags &")<CR>
nnoremap <leader>t :TagbarToggle<CR>

nnoremap <leader>U :UndotreeToggle<CR>
nnoremap <leader>u :update<CR>

nnoremap <leader>M :Neomake<CR>
nnoremap <leader>m :Marks<CR>

nnoremap <leader>N :let @/ = ""<CR>
nnoremap <leader>n :noh<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" These really belong in a Denite menu or custom FZF menu
nnoremap <leader>sn :sp notes.md<CR>

nnoremap <leader>se :sp $HOME/.zshenv<CR>

nnoremap <leader>si :sp $HOME/dotfiles/init.vim<CR>
nnoremap <leader>st :sp $HOME/dotfiles/.tmux.conf<CR>
nnoremap <leader>sv :sp $HOME/dotfiles/init.vim<CR>
nnoremap <leader>sz :sp $HOME/dotfiles/.zshrc<CR>

nnoremap <leader>sd :sp $HOME/Notes/TODO.md<CR>
nnoremap <leader>sm :sp $HOME/Notes/MACHINE-LEARNING.md<CR>
nnoremap <leader>so :sp $HOME/Notes/ONCALL.md<CR>
nnoremap <leader>sq :sp $HOME/Notes/QUESTIONS.md<CR>
nnoremap <leader>sr :sp $HOME/Notes/RETRO.md<CR>
nnoremap <leader>ss :sp $HOME/Notes/SCRUM.md<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""
" FZF

let g:fzf_history_dir = '~/.local/share/fzf-history'

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
imap <c-x><tab> <plug>(fzf-maps-i)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-b> <plug>(fzf-complete-buffer-line)

" Advanced customization using autoload functions
" inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

nnoremap <leader>* :Rg <C-r><C-w><CR>
nnoremap <leader>/ :Rg ^<CR>
nnoremap <leader><BS> :History:<CR>
nnoremap <leader><C-r> :History:<CR>
nnoremap <leader><C-s> :History/<CR>
nnoremap <leader><leader> :Commands<CR>
nnoremap <leader>F :Filetypes<CR>
nnoremap <leader>H :History<CR>
nnoremap <leader>J :Tags<CR>
nnoremap <leader>L :Lines<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>gf :GFiles<CR>
nnoremap <leader>j :BTags<CR>
nnoremap <leader>k :Helptags<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>r :History<CR>


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
  " call VimuxSendKeys('Enter')
endfunction

function! VimuxLine()
  call VimuxSendText(getline('.'))
  call VimuxSendKeys('Enter')
endfunction

" These have stopped working since whenever
" Basically, a <CR> in @v will end VimuxSendText
vmap [vimux]s "vy :call VimuxSlime()<CR>
nmap [vimux]s vip[vimux]s<CR>


"""""""""""
""" autocmd

augroup event_cursorhold
  autocmd!

  " Autosave all on CursorHold (so won't rewrite unless changed)
  " au CursorHold * nested :wa

  " Autoload external changes to open buffers if unchanged locally else ask
  au CursorHold * checktime
augroup END

" Clojure
" See https://github.com/benekastah/neomake/issues/15
" Q: Can/should I get Eastwood running too?
augroup filetype_clojue
  autocmd!
  au FileType clojure setlocal makeprg=lein\ kibit\ %
  au FileType clojure setlocal errorformat=%IAt\ %f:%l:,%C%m,%Z,%-G%.%#
augroup END

let g:neomake_clojure_kibit_maker = {
      \ 'buffer_output': 1,
      \ 'exe': 'lein',
      \ 'args': ['kibit'],
      \ 'errorformat': '%IAt\ %f:%l:,%C%m,%Z,%-G%.%#',
      \ }
let g:neomake_clojure_enabled_makers = ['kibit']

" Lua has : in keywords
augroup filetype_lua
  autocmd!
  autocmd FileType lua setlocal iskeyword+=:
augroup END

" as per https://gist.github.com/matthewhudson/1475276
augroup filetype_gitcommit
  autocmd!
  au FileType gitcommit setlocal textwidth=74
augroup END

" NERDTree quit if only window left open
augroup event_bufenter
  autocmd!
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" OS X and crontabs. moan. sigh. groan.
augroup filetype_crontab
  autocmd!
  autocmd filetype crontab setlocal nobackup nowritebackup
augroup END

" IPython
au bufenter *.ipynb set filetype=json

" Python
" Maybe this should be a toggle, but VimuxLine isn't working too well these days
augroup filetype_python
  autocmd!
  autocmd FileType python nnoremap <buffer> <CR> :call VimuxLine()<CR><CR>
  autocmd FileType python setlocal nofoldenable
  autocmd FocusLost *.py :update
  " autocmd CursorHold *.py :update
augroup END

" Adding mypy so we get some type checking
let g:neomake_python_enabled_makers = ['python', 'frosted', 'pylama', 'mypy']
let g:neomake_python_pylama_maker = {
      \ 'args': ['--force', '--format', 'pep8', '--ignore', 'E501']
      \ } " run pylama on Python scripts that don't end in .py
let g:neomake_clojure_enabled_makers = ['kibit']

" Useful:
" import pip
" from subprocess import call
" for dist in pip.get_installed_distributions():
"     call("pip install --upgrade " + dist.project_name, shell=True)


"""""""""""""""
""" colorscheme

" Not sure what these actually do?
" execute "set t_8f=\e[38;2;%lu;%lu;%lum"
" execute "set t_8b=\e[48;2;%lu;%lu;%lum"

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'colorscheme': 'solarized',
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

colorscheme solarized8_light_high
" colorscheme solarized8_dark_high
" colorscheme wombat
