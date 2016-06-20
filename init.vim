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
" Good idea: binding for 'send this selection to tmux pane x'
"
" Markdown mode O has a funny indentation and I'm not sure why
"
" Can I change some visual state to indicate that leader or local leader has been pressed?
"
" VimFiler jumps in, Tagbar does not. Inconsistent!
"
" Unite menu could be used for dotfile editing, etc
"
" Find instances of tag in file (not across files) (UniteWithCursorWord tag/include)
"
" Add buffer names to each of the unite buffers possibly?
"
" Remember to use vis instead of this other goofy stuff
"
" Tags shortcut should do a mv at the end
"
" More git diff viewers and file finders (possibly through Unite) for head~1, master, origin, etc.
"
" Can I scroll back through previous things I typed into a unite buffer when I reopen a buffer?
"
" Can I get a jobstart that doesn't close when I close vim?
"
" Wait, do I want :Unite filelist ... :Git! diff-tree --no-commit-id --name-only -r head~1
"
" VimFiler and Fugitive interact badly
"
" Can I get tags to show up on the vim help files?
"
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

" Rust
Plug 'rust-lang/rust.vim'

" Scala
" Q: Could we get autocompletion without Ensime? It's so janky.
Plug 'derekwyatt/vim-sbt'
Plug 'derekwyatt/vim-scala'
Plug 'ensime/ensime-vim', { 'do': function('DoRemote') }

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
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
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
Plug 'mbbill/undotree'
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
  " let g:unite_source_rec_async_command = ['git', 'diff', '--name-only', 'head~1']
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

" file_rec/git should hit everything under git with a few exceptions
call unite#custom#source('file, file/async, file/new, file_include, file_list, file_mru, file_point, file_rec, file_rec/async, file_rec/neovim', 'ignore_globs', split(&wildignore, ','))
call unite#custom#source('file_mru', 'sorters', 'ftime')
call unite#custom#source('file_rec/git', 'ignore_globs', ['/bower_components/', '/dev-server/', '/karma/'])
call unite#custom#source('grep', 'matchers', 'matcher_fuzzy')

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_selecta'])


"""""""
""" let

let base16colorspace=256

let g:VimuxRunnerIndex = 2

let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16'

" TODO: Some of these copy ignorecase and smart_case, set those instead
" autocomplete delay is necessary because tmux-complete slows down insertion too much
let g:deoplete#auto_complete_delay = 100
let g:deoplete#auto_completion_start_length = 2
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" let g:deoplete#sources._=['buffer', 'member', 'tag', 'file', 'omni', 'ultisnips']<Paste>

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

let g:scala_first_party_namespaces='.*\(cetera\|phidippides\|procrustes\|rammstein\|\unobtanium).*'
let g:scala_sort_across_groups=1
let g:scala_use_builtin_tagbar_defs = 0

" Double the defaults
let g:unite_source_tag_max_name_length = 50
let g:unite_source_tag_max_kind_length = 16
let g:unite_source_tag_max_fname_length = 40
let g:unite_source_tag_name_footer_length = 20
let g:unite_source_tag_fname_footer_length = 30

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

let g:undotree_SplitWidth = 40

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
" NOTE: This may no longer be necessary, and it would free up \
let mapleader=" "
let maplocalleader="\\"
nmap , <localleader>


"""""""""""""""""""
" Configs and Notes
nnoremap <leader>sn :sp notes.md<CR>
nnoremap <leader>sv :sp $HOME/dotfiles/init.vim<CR>


"""""""""""""""""""""
" Saving and Quitting

nnoremap <leader>Q :qa<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>W :wa<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>X :xa<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>c :close<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>z :w<CR>:bd<CR>
nnoremap <leader>Z :xa!<CR>

"""""""""
" Windows

nnoremap <C-Tab> <C-w>w
nnoremap <C-S-Tab> <C-w>W

nnoremap <leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <leader>= <C-w>=
nnoremap <leader>o :only<CR>
nnoremap <leader>ss :split<CR>
nnoremap <leader>vv :vsplit<CR>


""""""""""
" Comments
noremap <leader>; :Commentary<CR>

""""""""""
" Fugitive
"
" Remember gitgutter's <leader>h bindings
" nmap <Leader>hs <Plug>GitGutterStageHunk
" nmap <Leader>hr <Plug>GitGutterRevertHunk
" nmap <Leader>hp <Plug>GitGutterPreviewHunk

nnoremap [fugitive] <Nop>
nmap <leader>g [fugitive]

nnoremap [fugitive] :Unite mapping -input=[fugitive]<CR>

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


""""""""""""""
" Highlighting

nnoremap <leader>hh :let @/ = ""<CR>


""""""""""
" Terminal
" Q: How to send <Esc> inside terminal?

tnoremap <Esc> <C-\><C-n>
nnoremap <leader>' :split \| terminal<CR>

""""""
" Undo

nnoremap <leader>U :UndotreeToggle<CR>

"""""""
" Unite

nnoremap [unite] <Nop>
nmap <leader>u [unite]
nnoremap [unite] :Unite<CR>

nnoremap <leader><leader> :Unite -buffer-name=commands command<CR>
nnoremap <leader><BS> :Unite -buffer-name=resume-unite resume<CR>
nnoremap <leader><C-h> :Unite -buffer-name=resume-unite resume<CR>

nnoremap <leader># :UniteWithCursorWord -buffer-name=grep-cursor-word grep:.<CR>
nnoremap <leader>& :UniteWithCursorWord -buffer-name=cursor-word-files file_rec/git:.<CR>
nnoremap <leader>* :UniteWithCursorWord -buffer-name=git-grep-cursor-word grep/git:.<CR>
nnoremap <leader>/ :Unite -buffer-name=git-grep grep/git:.<CR>
nnoremap <leader>: :Unite -buffer-name=commands command<CR>
nnoremap <leader>? :Unite -buffer-name=grep grep:.<CR>
nnoremap <leader>@ :UniteWithCursorWord -buffer-name=cursor-word-files file_rec/async:.<CR>
nnoremap <leader>] :UniteWithCursorWord tag:/^.:.<CR>
nnoremap <leader>^ :Unite menu<CR>
nnoremap <leader>` :UniteWithInputDirectory file<CR>$HOME/notes/<CR>
nnoremap <leader>~ :UniteWithInputDirectory file<CR>$HOME<CR>

nnoremap <leader>C :Unite -unique change<CR>
nnoremap <leader>D :UniteWithInputDirectory -buffer-name=dotfiles file<CR>$HOME/dotfiles<CR>
nnoremap <leader>N :UniteWithInputDirectory -buffer-name=notes file<CR>$HOME/notes<CR>
nnoremap <leader>O :Unite -buffer-name=outline outline<CR>

" These tend to be across-buffers or within-project-directory
nnoremap <leader>B :Unite -buffer-name=bookmarks bookmark<CR>
nnoremap <leader>F :Unite -buffer-name=all-files -resume file_rec/async -input=<CR>
nnoremap <leader>I :Unite -buffer-name=project-tags -resume tag -input=<CR>
nnoremap <leader>K :Unite -buffer-name=key-mappings mapping<CR>
nnoremap <leader>L :Unite -buffer-name=buffer-lines line:buffers<CR>
nnoremap <leader>M :Unite tmuxcomplete/lines<CR>
nnoremap <leader>N :UniteLast<CR>
nnoremap <leader>P :UniteFirst<CR>
nnoremap <leader>R :Unite -buffer-name=all-recent-files file_mru<CR>
nnoremap <leader>S :Unite -buffer-name=scripts script<CR>
nnoremap <leader>Y :Unite register<CR>

" These tend to be within-buffer or within-project-source-control
nnoremap <leader>b :Unite -buffer-name=buffers buffer<CR>
nnoremap <leader>f :Unite -buffer-name=git-files file_rec/git -input=<CR>
nnoremap <leader>i :Unite -buffer-name=buffer-tags tag/include<CR>
nnoremap <leader>j :Unite -buffer-name=jumps jump jump_point<CR>
nnoremap <leader>k :Unite -unique change<CR>
nnoremap <leader>l :Unite -buffer-name=buffer-lines line:all<CR>
nnoremap <leader>m :Unite tmuxcomplete<CR>
nnoremap <leader>n :UniteNext<CR>
nnoremap <leader>p :UnitePrevious<CR>
nnoremap <leader>r :UniteWithProjectDir -buffer-name=project-recent-files file_mru<CR>
nnoremap <leader>s :Unite -buffer-name=sources source<CR>
nnoremap <leader>y :Unite history/yank<CR>

" Unite splits
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  "{{{
  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  "}}}
endfunction


""""""
" Tags

nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>T :call jobstart('ctags --exclude=@$HOME/.ctagsignore -RV -f tags-regenerating . && mv tags-regenerating tags')<CR>


""""""""""
" VimFiler

nnoremap [vimfiler] <Nop>
nmap <leader>vf [vimfiler]

nnoremap [vimfiler] :Unite mapping -input=[vimfiler]<CR>
nnoremap [vimfiler]b :VimFilerBufferDir<CR>
nnoremap [vimfiler]c :VimFilerCurrentDir<CR>
nnoremap [vimfiler]d :VimFilerDouble<CR>
nnoremap [vimfiler]e :VimFilerExplorer<CR>
nnoremap [vimfiler]f :VimFilerExplorer -find<CR>
nnoremap [vimfiler]s :VimFilerSplit<CR>
nnoremap [vimfiler]t :VimFilerTab<CR>

nnoremap - :VimFilerBufferDir<CR>
nnoremap \| :VimFilerSplit<CR>
nnoremap <leader>e :VimFilerExplorer<CR>
nnoremap <leader>E :VimFilerExplorer -find<CR>


"""""""
" Vimux
"
" TODO: send region, selection, line to pane n

nnoremap [vimux] <Nop>
nmap <leader>v [vimux]
vmap <leader>v [vimux]
nnoremap [vimux] :Unite mapping -input=[vimux]<CR>

nnoremap [vimux]<leader> :let g:VimuxRunnerIndex=

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

set background=light
colorscheme base16-default
