" Vim is a player's racquet
"
" C-h broken? See https://github.com/neovim/neovim/issues/2048
"
" Get NeoMake listing next and previous to work (they aren't relative to cursor position)
" Sort quickfix window by line number, can it be done?
"
" Gdiff should have $BASE, $LOCAL, $REMOTE, $MERGED or something like that
" gggqG (is there something shorter?)
" <leader>gf should support the usual master, origin, merged, etc. (it's broken now anyway)
"
" Q: How best to store favorite regexes?
" A: Likely you'll want some leader-key bindings or named fns for common calls
" Essential ruby regex: s/:\(\w\+\)=>/\1: /g
" Essential python call: !python -m json.tool
"
" Should I try to get auto-save on focus-lost working? I hit SPC-w too much
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
" Can I unite git diff master files?
"
" Can I unite grep through just the open buffers?
"
" Don't toggle paste, just use yo and yO
"
" The main things about editing:
" * Navigation -> Unite, VimFiler, ctags
" * SCM interaction -> Fugitive
" * REPL (Tmux integration) -> Vimux
" * Autocompletion -> Deoplete (with #input_patterns for special omni)
" * Code comprehension -> Problematic
"   - Docs
"   - Find uses of (refactoring)
"   - Semantic completion -> Omni + 3rd party services
"   - Syntax checking -> NeoMake
"   - Type taxonomy exploration
"
" aucommand to change wildignore based on project type
"
" Markdown headings to tagbar
"
" C-; is unused
"
" VimFiler interacts with Fugitive (git blame) badly
" VimFiler choose, how to open new split from there?
"
" M-p and M-n in normal more for [b and ]b ?
"
" What if you have too many leader key mappings?
" Maybe tpope's approach of unused key seqs is better?
"
" Can I trigger deoplete with tab when it's in timeout mode?
"
" binding for 'send this selection to tmux pane x'
"
" Markdown mode O has a funny indentation and I'm not sure why
"
" Can I change some visual state to indicate that leader or local leader has been pressed?
"
" VimFiler jumps in, Tagbar does not. Inconsistent!
"
" Unite menu could be used for dotfile editing, etc
"
" Find instances of tag in file (not across files)
"
" Add buffer names to each of the unite buffers possibly?
"
" Remember to use vis instead of this other goofy stuff

""""""""
""" Plug

"" This is non-standard, because I migrated from NeoBundle
"" TODO: rename to plug or whatever is the norm or look into Shougo's new project
call plug#begin('~/.config/nvim/bundle')

" About 70 plugins, that's probably too many (right Spacemacs?)

" C/C++
Plug 'justmao945/vim-clang'

" Clojure
" salve?
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'guns/vim-sexp'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
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
Plug 'ensime/ensime-vim'

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
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

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
Plug 'Shougo/unite-outline'
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
  let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
endif

let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1

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

" ignores necessary for my various projects
set wildignore+=/bower_components/
set wildignore+=/dev-server/
set wildignore+=/karma/

call unite#custom#source('file, file/async, file/new, file_include, file_list, file_mru, file_point, file_rec, file_rec/async, file_rec/neovim', 'ignore_globs', split(&wildignore, ','))
call unite#custom#source('file_mru', 'sorters', 'ftime')
" file_rec/git should hit everything under git with a few exceptions
call unite#custom#source('file_rec/git', 'ignore_globs', ['/bower_components/', '/dev-server/', '/karma/'])
call unite#custom#source('grep', 'matchers', 'matcher_fuzzy')

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_selecta'])


"""""""
""" let

let base16colorspace=256

let g:VimuxRunnerIndex = 2

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#left_sep = ' '
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16'

" TODO: Some of these copy ignorecase and smart_case, set those instead
" autocomplete delay is necessary because tmux-complete slows down insertion too much
let g:deoplete#auto_complete_delay = 100
let g:deoplete#auto_completion_start_length = 2
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

let g:deoplete#omni#input_patterns = {}

" see https://github.com/ensime/ensime-vim/pull/259
let g:deoplete#omni#input_patterns.scala = '[^. *\t]\.\w*'

" These may make some trouble, have a second look
" let g:deoplete#omni#input_patterns.java = '[^. *\t]\.\w*'
" let g:deoplete#omni#input_patterns.scala = '[^. *\t]\.\w*'
" let g:deoplete#omni#input_patterns.ruby = ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::']

" or maybe we need let g:deoplete#omni_patterns.tex =
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

let g:gitgutter_grep_command = 'ag --nogroup --nocolor --hidden'
let g:haddock_browser = "firefox"
let g:haddock_docdir="/usr/local/share/doc/ghc/html/"

" pymode should not use global leader, omg srsly.
let g:pymode_breakpoint_bind = '<localleader>b'
let g:pymode_run_bind = '<localleader>r'

" Neomake runs pylama
let g:pymode_lint = 0

let g:python3_host_prog = 'python3'

let g:rainbow_active = 1

let g:scala_first_party_namespaces='.*\(cetera\|phidippides\|procrustes\|rammstein\).*'
let g:scala_sort_across_groups=1
let g:scala_use_builtin_tagbar_defs = 0


""""""""
" Tagbar

let g:tagbar_sort = 0

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


let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_filters = ['matcher_ignore_pattern', 'matcher_ignore_wildignore']

let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1

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
set tags=tags,.tags;
set textwidth=100
set undofile
set undolevels=1000
set undoreload=10000


""""""""""""
""" MAPPINGS
"
" Inspired by Spacemacs, but semantically vimmish

" Leaders
" This way, you can use , as local leader and still have , work for reverse last command
let mapleader=" "
let maplocalleader="\\"
nmap , <localleader>
nmap <leader>m <localleader>

" Saving and Quitting
"nnoremap <leader><ESC> :qa<cr>

nnoremap <leader>Q :qa<cr>
nnoremap <leader>q :q<cr>

nnoremap <leader>W :wa<cr>
nnoremap <leader>w :w<cr>

nnoremap <leader>X :xa<cr>
nnoremap <leader>x :x<cr>

nnoremap <leader>c :close<cr>

nnoremap <leader>d :bd<cr>

nnoremap <leader>z :w<cr>:bd<cr>
nnoremap <leader>Z :xa!<cr>

" Windows

" And then use C-i instead of Tab
nnoremap <C-Tab> <C-w>w
nnoremap <C-S-Tab> <C-w>W

nnoremap <leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <leader>= <C-w>=
nnoremap <leader>o :only<cr>
nnoremap <leader>ss :split<cr>
nnoremap <leader>vv :vsplit<cr>

nnoremap <leader>~ :UniteWithInputDirectory file<CR>$HOME<CR>
nnoremap <leader>` :UniteWithInputDirectory file<CR>$HOME/notes/<CR>

" Edit Files
" TODO: Think about a Unite environment (documents), Unite project docs, etc.
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

" Fugitive
" Consider <leader>gd_ for different sources

nnoremap [fugitive] <Nop>
nmap <leader>g [fugitive]

nnoremap [fugitive]b :Gblame<CR>
nnoremap [fugitive]c :Gcommit<CR>
nnoremap [fugitive]d :Gdiff<CR>
nnoremap [fugitive]e :Gedit<CR>
nnoremap [fugitive]f :Git! diff --name-only master<CR>
nnoremap [fugitive]g :copen<CR>:Ggrep 
nnoremap [fugitive]h :Gdiff origin/HEAD<CR>
nnoremap [fugitive]m :Gdiff master<CR>
nnoremap [fugitive]o :Gdiff origin<CR>
nnoremap [fugitive]r :Gread<CR>
nnoremap [fugitive]s :Gstatus<CR>
nnoremap [fugitive]w :Gwrite<CR>
nnoremap [fugitive]x :Gbrowse<CR>

" Misc
" Remember gitgutter's <leader>h bindings
" nmap <Leader>hs <Plug>GitGutterStageHunk
" nmap <Leader>hr <Plug>GitGutterRevertHunk
" nmap <Leader>hp <Plug>GitGutterPreviewHunk
nnoremap <leader>hh :let @/ = ""<cr>
noremap <leader>; :Commentary<cr>

" Tags
" See also Unite tags
" split open key binding is not quite right
nnoremap <C-M-]> :sp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <leader>T :call jobstart('/usr/local/bin/ctags --exclude=@/Users/jasonkroll/.ctagsignore -RV .')<cr>
nnoremap <leader>t :TagbarToggle<CR>

" Terminal
" <leader>' for :terminal ?
" Q: How to send <Esc> inside terminal?
tnoremap <Esc> <C-\><C-n>
nnoremap <leader>' :split \| terminal<CR>


"""""""
" Unite

" TODO: <leader>p for UniteWithProjectDir

""""""""""""""""""""""""""
" Unite - shallow mappings

nnoremap [unite] <Nop>
nmap <leader>u [unite]

nnoremap [unite] :Unite<CR>
nnoremap <leader>U :Unite -buffer-name=resume resume<CR>

" alternate files (needs filename source)
" tags get 'a' and 'A' until we figure this out
" nnoremap <leader>a :Unite file_rec/git -input=
" nnoremap <leader>A :Unite file_rec/git -input=

" buffers
nnoremap <leader>b :Unite buffer bookmark<cr>

" command
nnoremap <leader>: :Unite command<cr>

" files
" nnoremap <leader>f :Unite file<cr>

" files most recently used
nnoremap <leader>m :UniteWithProjectDir file_mru<cr>
nnoremap <leader>M :Unite file_mru<cr>

" files recursive
nnoremap <leader>r :Unite file_rec/git<cr>
nnoremap <leader>R :Unite file_rec/async<cr>
nnoremap <leader>& :UniteWithCursorWord file_rec/git:.<cr>
nnoremap <leader>@ :UniteWithCursorWord file_rec/async:.<cr>

" grep
nnoremap <leader>/ :Unite grep/git:.<cr>
nnoremap <leader>? :Unite grep:.<cr>
nnoremap <leader>* :UniteWithCursorWord grep/git:.<cr>
nnoremap <leader># :UniteWithCursorWord grep:.<cr>

" jump
nnoremap <leader>j :Unite jump<cr>

" lines
nnoremap <leader>l :Unite line:all<cr>

" tags
" TODO: reorganize tag bindings!!! including generation and tagbar
nnoremap <leader>$ :Unite tag/file<cr>
nnoremap <leader>% :Unite tag<cr>

nnoremap <leader>a :Unite tag/file<cr>
nnoremap <leader>A :Unite tag<cr>

nnoremap <leader>i :Unite tag/include<cr>
nnoremap <leader>I :Unite tag:%<cr>

nnoremap <leader>] :UniteWithCursorWord tag:/^.:.<cr>

" yank
nnoremap <leader>y :Unite history/yank<cr>
nnoremap <leader>y :Unite register<cr>

" first, prev, next, last
nnoremap <leader>P :UniteFirst<cr>
nnoremap <leader>p :UnitePrevious<cr>
nnoremap <leader>n :UniteNext<cr>
nnoremap <leader>N UniteLast<cr>

" Unite splits
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  "{{{
  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  "}}}
endfunction

""""""""""
" VimFiler

nnoremap [vimfiler] <Nop>
nmap <leader>vf [vimfiler]

" TODO: add :Unite mapping on timeouts

nnoremap [vimfiler] :Unite mapping -input=[vimfiler]<CR>
" nnoremap [vimfiler] :VimFiler<CR>
nnoremap [vimfiler]b :VimFilerBufferDir<CR>
nnoremap [vimfiler]c :VimFilerCurrentDir<CR>
nnoremap [vimfiler]d :VimFilerDouble<CR>
nnoremap [vimfiler]e :VimFilerExplorer<CR>
nnoremap [vimfiler]f :VimFilerExplorer -find<CR>
nnoremap [vimfiler]s :VimFilerSplit<CR>
nnoremap [vimfiler]t :VimFilerTab<CR>

nnoremap - :VimFilerBufferDir<CR>
nnoremap \| :VimFilerSplit<CR>
nnoremap <leader>f :VimFilerExplorer<CR>
nnoremap <leader>F :VimFilerExplorer -find<CR>

"""""""
" Vimux

nnoremap [vimux] <Nop>
nmap <leader>v [vimux]
vmap <leader>v [vimux]

function! VimuxSlime()
 call VimuxSendText(@v)
 call VimuxSendKeys("Enter")
endfunction

vmap [vimux]s "vy :call VimuxSlime()<CR>
nmap [vimux]s vip[vimux]s<CR>

nnoremap [vimux] :Unite mapping -input=[vimux]<CR>

nnoremap [vimux]<leader> :let g:VimuxRunnerIndex=
nnoremap [vimux]i :VimuxInspectRunner<CR>
nnoremap [vimux]l :VimuxRunLastCommand<CR>
nnoremap [vimux]p :VimuxPromptCommand<CR>
nnoremap [vimux]q :VimuxCloseRunner<CR>
nnoremap [vimux]r :VimuxRunCommand ''<left>
nnoremap [vimux]x :VimuxInterruptRunner<CR>
nnoremap [vimux]z :call VimuxZoomRunner()<CR>

"""""""""""
""" autocmd

" Override that obnoxious bar in pymode
" Q: Does python-mode let us turn this off directly?
au FileType python setlocal textwidth=0

" OS X and crontabs. moan. sigh. groan.
autocmd filetype crontab setlocal nobackup nowritebackup

" Neomake
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


"""""""""""""""
""" colorscheme

set background=dark
colorscheme base16-default
