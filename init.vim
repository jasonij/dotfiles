" Vim is a player's racquet
"
" TODO:
"
" Can I get the quickfix window to follow my cursor position (so next is relative to cursor?)
"
" Subvert more often! e.g., :'<,'>S/categor{y,ies}/tag{,s}/g
"
" Make use of marks! ''
"
" ]C and [C to go along with ]c and [c (add to git-gutter?)
"
" What can I do about tagging methods inside of bin/ scripts without extensions?
"
" Make this Neovim and Vim8 compatible
"
" Possibly add non-plugin alternatives like <leader>b => :ls<cr>:
"
" vip and %cpaste on like M-ret or S-ret or C-ret or something like that
"
" Try to get :History to start populated with the current project's directory
"
" ]* and [* and possibly ]# and [# for last and first search matches
"
" Get C-r C-w working in Terminal? Very useful for FZF et al
"
" Get the filename for grepping without the path attached (see who includes it)
"
" Readline C-s and C-r are incredibly useful! Can we port something analogous?
" I'd really like FZF line to include cursor position (like Swiper)
"
" List of files touched in the last n commits
"
" Bindings for :cw and :lw because I type them sooo often
"
" fzf-vim docs have typo line 125 the spaces are non-standard so copy paste fails
"
" Can I gq with textwidth 79 even when default is textwidth 99?
"
" There is not (is there?) a repeat last motion command?
"
" fzf speller is not useful because plurals etc are missing
"
" Run mypy separately as it's a slow type checker not a linter
"
" I need a way to grab by previous c-r c-w when I'm in terminal
"
" Glob ~/.ignore into wildignore?
"
" Consider a [file] prefix because you do a lot of different file commands
"
" Can I get delete-to to accept vim-sneak two-char bindings?
"
" Look into double-mapping CTRL to ESC when pressed alone
"
" Maybe <leader>$ for finding a file with the given cursorword or something?
"
" Consider parting from leader s_ and v_ bindings because of all the split commands
"
" Because of so many huge data files in my directories, I need Rg for git-only
"
" C-S-hjkl for window rezising like M-S-hjkl in XMonad / Tmux
"
" Abbreviate paths in quickfix and location list?
"
" Quick binding to \"%run current file in ipython\"
"
" Learn :Gitv better
"
" Python consider turning off W391 blank line EOF
"
" Yes, we really need a toggle-able autosave because holy cow it's tedious to save manually
" - just add the status to the lightline or whatever and you'll remember
"
" assert np.abs(-2**63) == 2 ** 63
"
" Seriously after C-] I want to center things with zz
"
" Consider only using jedi completion when given . (as is typical with other completions)
"
" Maybe have <leader>w 2-key bindings and use <leader>u for update
"
" VimuxPrompt %run C-r % <CR> key binding in Python (maybe ,s or ,f or something)
"
" In text mode, maybe do the funny line thing with hjkl
"
" Try not to have to lean on <leader>n so often, maybe automate and repurpose
"
" Get FZF to accept C-g as C-c because you know it's a habit
"
" Consider <leader>] and/or <leader>} or something for tags
"
" alias s to open nvim with :Gstatus but that seems to be complicated
"
" You don't use fasd but something similar from within vim
" call fzf#run(fzf#wrap({'source': 'fasd -d -R', 'sink': { line -> execute('cd '.split(line)[-1]) }}))
"
" More autosave! Stop hitting <leader>u incessantly
" Try :update on exit from insert mode when in git repo or something similar
"
" tagbar sort by location at least for .md files?
"
" C-k in insert mode ought to work
"
" Autopairs seems good, also look into UltiSnips
"
" Open modified files into quickfix or location window
"
" <leader>i for 'inside', basically TagBar or something analogous
"
" Drop a for Ag (just use Rg) and let it toggle two strengths of autosave
"
" Add autosave to status line or is it awfully evident?
"
" Can I get paste detection to restepce my authoritmux?
"
" execute '%!python -m json.tool' | w
"
" Shortcuts for files to certain directories
"
" Denite the changelist?
"
" Resolve the dbext leader issues (why did it takeover my leader keybindings?)
"
" Try something like extension-specific grepping or something
"
" I want something like <leader>g/ like <leader>gg for ripgrep on VC files

""""""""
""" Plug

let g:plug_shallow = 0  " No shallow clones! I need full repos, I need a computer.
call plug#begin('~/.local/share/nvim/plugged')

" About 80 plugins, that's probably too many (right Spacemacs?)

" C (C++, like JavaScript, has some good parts, but you have to restrict yourself)
Plug 'justmao945/vim-clang'

" Clojure / LISPs -- sorry not doing too much right now
" Plug 'clojure-vim/async-clj-omni', { 'for': 'clojure' }
" Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
" Plug 'guns/vim-sexp'
Plug 'luochen1990/rainbow'
" Plug 'snoe/clj-refactor.nvim', { 'for': 'clojure' }
" Plug 'tpope/vim-classpath', { 'for': 'clojue' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'tpope/vim-salve', { 'for': 'clojure' }
" Plug 'tpope/vim-sexp-mappings-for-regular-people'

" Data Formats
Plug 'cespare/vim-toml'
Plug 'chrisbra/csv.vim'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'

" Git
" If you must use something other that git, Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'

" Java (NOOOOO!)
Plug 'artur-shaik/vim-javacomplete2'

" Julia
Plug 'JuliaLang/julia-vim'  " this is borked if you try { 'for': 'julia' }

" LaTeX
Plug 'lervag/vimtex'  " put `$pdflatex = 'xelatex --shell-escape %O %S';` in ~/.latexmkrc

" Python
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }

" R
Plug 'jalvesaq/Nvim-R', { 'for': 'r'}

" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" Scala
Plug 'derekwyatt/vim-sbt', { 'for': 'scala' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

" Tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'tmux-plugins/vim-tmux'

" BUG: Tmux-complete overwrites the tmux copy paste buffer with a full-pane text grab
" REPRO: Copy something reasonable into tmux buffer, paste it in vim, then trigger tmux-complete,
" and now try pasting from the tmux buffer.

" Q: Am I the only person on this planet with this problem?
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

" deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" recommended for deoplete
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'Konfekt/FastFold'

"" Shougo misc
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

"" et al
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ChrisKempson/Tomorrow-Theme'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/base16-vim'
" Plug 'flazz/vim-colorschemes'
Plug 'francoiscabrol/ranger.vim'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jnurmine/Zenburn'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'justinmk/vim-sneak'
Plug 'kassio/neoterm'
Plug 'lifepillar/vim-solarized8'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'moll/vim-bbye'
Plug 'morhetz/gruvbox'
Plug 'neomake/neomake'
Plug 'schickling/vim-bufonly'
Plug 'scrooloose/nerdtree'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'vim-scripts/VisIncr'
Plug 'vim-scripts/Wombat'
Plug 'vim-scripts/dbext.vim'

call plug#end()


"""""""""
""" Calls

" Neomake  (200 ms is short, don't use this on laptop battery power)
call neomake#configure#automake('nw', 200)
let g:neomake_logfile = '/tmp/neomake.log'
let g:neomake_virtualtext_current_error = 0  " inline is awful


""""""""""""""""""
""" neosnippet.vim

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.config/nvim/bundle/vim-snippets/snippets'

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

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
set wildignore+=*.aux,*.out,*.toc "Latex Intermediate files"
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

" Sketchy conveniences for current projects, so remember to purge these
set wildignore+=.log,.csv,.tsv,.sql,.gz

" .mypy_cache/ is getting in the way
set wildignore+=.mypy_cache/

" always something
set wildignore+=*.egg-info/

" builds
" set wildignore+=*/build/*

"""""""
""" let

" For some reason, NERDTreeRespectWildIgnore is not exactly working
let g:NERDTreeIgnore=['build$']
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeWinSize = 60

let g:SimpylFold_fold_import = 1

let g:VimuxRunnerIndex = 2

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" set equal to num_sources
call deoplete#custom#option({
      \ 'min_pattern_length': 3,
      \ 'num_processes': -1,
      \ 'smart_case': v:true
      \ })

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

" Q: What makes this so much faster than default {}?
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['around', 'buffer', 'dictionary', 'file', 'member', 'tag', 'neosnippet']
let g:deoplete#sources.python = ['buffer', 'file', 'member', 'jedi', 'neosnippet', 'tag']

let g:deoplete#sources#jedi#enable_typeinfo = 1
let g:deoplete#sources#jedi#server_timeout = 60

" What does this do again?
let g:echodoc_enable_at_startup = 1

" Gruvbox
let g:gruvbox_italic = 1

let g:jedi#auto_close_doc = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 0
let g:jedi#goto_command = '<localleader>d'
let g:jedi#goto_assignments_command = '<localleader>g'
let g:jedi#documentation_command = 'K'
let g:jedi#usages_command = '<localleader>n'
let g:jedi#completions_command = '<C-Space>'
let g:jedi#rename_command = '<localleader>r'

" Open lw automatically
" let g:neomake_open_list = 2

let g:neoterm_repl_ruby = 'pry'

let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1

" Without this, rainbow won't even load in the first place
let g:rainbow_active = 1

" TODO: Check if on Linux or Mac and adjust accordingly
" NOTE: Really it would be nice if we could use $HOME or $PYENV_ROOT here
let g:python_host_prog = '/Users/jkroll/.pyenv/versions/2.7.12/bin/python'
let g:python3_host_prog = '/Users/jkroll/.pyenv/versions/3.6.4/bin/python'

let g:pymode_rope = 0

let g:ranger_map_keys = 0

let g:scala_sort_across_groups=1
let g:scala_use_builtin_tagbar_defs = 0


let g:tmuxcomplete#trigger = ''

let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = 'tmux'
let g:tmuxline_theme = 'lightline'

let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_fold_enabled = 1

""""""""
" Tagbar

let g:tagbar_type_markdown = {
      \ 'ctagstype' : 'markdown',
      \ 'kinds' : [
          \ 'h:headings',
          \ 'l:links',
          \ 'i:images'
      \ ],
      \ 'sort' : 0
\ }

" let g:tagbar_type_markdown = {
"     \ 'ctagstype' : 'markdown',
"     \ 'kinds' : [
"         \ 'h:Heading_L1',
"         \ 'i:Heading_L2',
"         \ 'k:Heading_L3'
"     \ ]
" \ }



let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }

" not sure 'name' ever happens, what about & labels?
let g:tagbar_type_yaml = {
    \ 'ctagstype' : 'yaml',
    \ 'kinds' : [
        \ 'd:definition',
        \ 'n:name',
    \ ]
\ }

let g:undotree_SplitWidth = 40

" Fix vim-markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0  " conceal code is so awful
let g:vim_markdown_folding_style_pythonic = 1

"""""""
" Sneak

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

set autowrite

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
set clipboard+=unnamedplus
set completeopt-=preview
set cursorline
set encoding=utf-8
set expandtab
set hidden
set list
set nomodeline  " gaping security hole
set noshowcmd
set noshowmode
set number
set previewheight=20
set relativenumber
set shell=zsh
set shiftwidth=2
set shortmess+=c
set t_Co=256
set tabstop=2
set tags=./tags;
set textwidth=99
set undofile
set undolevels=1000
set undoreload=10000


""""""""""""
""" MAPPINGS
""" Inspired by Spacemacs

" Leaders
let g:mapleader=' '
let g:maplocalleader=','

" Escape a la Spacemacs, hope you aren't working on file descriptors
inoremap fd <Esc>

"""""
" Vim

nnoremap <leader>= <C-w>=zz

nnoremap <C-w>O :BufOnly<CR>zz
nnoremap <leader>O :BufOnly<CR>zz
nnoremap <leader>o :only<CR>zz

nnoremap <leader>C :Colors<CR>
nnoremap <leader>c :close<CR>

nnoremap <leader>D :Bdelete<CR>
nnoremap <leader>d :bdelete<CR>

nnoremap <leader>Q :qa<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader>W :wa<CR>
nnoremap <leader>w :w<CR>

nnoremap <leader>X :xa<CR>
nnoremap <leader>x :x<CR>

nnoremap <leader>Z :update<CR>:Bdelete<CR>
nnoremap <leader>z :update<CR>:bdelete<CR>

nnoremap <leader><C-w> :Windows<CR>

nnoremap <C-w>* <C-w><C-s>*
nnoremap <C-w># <C-w><C-s>#

" Allow C-l like in Emacs while in insert mode
" TODO: add the other useful bindings that aren't in rsi.vim
inoremap <C-l> <C-c>zzgi


""""""""""
" AutoSave

nnoremap <leader>a :AutoSaveToggle<CR>


""""""""
" Denite

" file_mru takes some work to make it project-specific
call denite#custom#source('file_mru', 'converters', ['converter_relative_word'])
call denite#custom#source('file_mru', 'matchers', ['matcher_substring', 'matcher_project_files'])

" file_mru/all for matching all recent files
call denite#custom#alias('source', 'file_mru/all', 'file_mru')
call denite#custom#source('file_mru/all', 'converters', ['converter_relative_word'])
call denite#custom#source('file_mru/all', 'matchers', ['matcher_substring'])

" TODO: At least give Denite some readline-style keybindings similar to FZF

" Denite is slower but can do things FZF can't
nnoremap <leader>: :Denite command<CR>
nnoremap <leader>" :Denite register<CR>
nnoremap <leader>B :Denite buffer:!<CR>
nnoremap <leader>K :DeniteCursorWord help<CR>
nnoremap <leader>R :Denite file_mru<CR>


""""""""""
" Fugitive (etc)
"
" Remember gitgutter's <leader>h bindings
" nmap <Leader>hs <Plug>GitGutterStageHunk
" nmap <Leader>hu <Plug>GitGutterUndoHunk
" nmap <Leader>hp <Plug>GitGutterPreviewHunk

" This sometimes helps to refresh if stuch but hasn't worked in recently
nnoremap <leader>ht <Plug>GitGutterLineHighlightsToggle

nnoremap [fugitive] <Nop>
nmap <leader>g [fugitive]

" TODO: Consider bringing these mappings more in alignment with oh-my-zsh aliases
nnoremap [fugitive] :Maps<CR>^[fugitive]
nnoremap [fugitive]? :GFiles?<CR>
nnoremap [fugitive]B :Git branch<Space>
nnoremap [fugitive]a :Gcommit --amend -v<CR>
nnoremap [fugitive]b :Gblame<CR>

" You can commit from Gstatus, best to check there first
" nnoremap [fugitive]c :Gcommit -v<CR>
nnoremap [fugitive]c :BCommits<CR>
nnoremap [fugitive]C :Commits<CR>

nnoremap [fugitive]d :Gdiff<CR>
nnoremap [fugitive]e :Gedit<CR>
nnoremap [fugitive]f :GFiles<CR>
nnoremap [fugitive]g :copen<CR>:Ggrep 
nnoremap [fugitive]l :silent! Glog<CR>
nnoremap [fugitive]m :Gmove<Space>
nnoremap [fugitive]o :Git checkout<Space>
nnoremap [fugitive]p :Ggrep<Space>
nnoremap [fugitive]pl :Dispatch! git pull<CR>
nnoremap [fugitive]ps :Dispatch! git push<CR>
nnoremap [fugitive]r :Gread<CR>
nnoremap [fugitive]s :Gstatus<CR>
nnoremap [fugitive]t :Gcommit -v %<CR>
nnoremap [fugitive]v :Gitv<CR>
nnoremap [fugitive]w :Gwrite<CR><CR>
nnoremap [fugitive]x :Gbrowse<CR>

""""""
" Misc

" - is for vinegar
nnoremap _ :Ranger<CR>
nnoremap <leader>- :NERDTreeToggle<CR>
nnoremap <leader>_ :NERDTreeFind<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>E :NERDTreeFind<CR>

noremap <leader>; :Commentary<CR>

" Q: How to send <Esc> inside terminal?
" A: tnoremap <Esc> <C-\><C-n>

" ' is better for marks in vim
nnoremap <leader>' :Marks<CR>

nnoremap <leader>U :UndotreeToggle<CR>
nnoremap <leader>u :update<CR>

nnoremap <leader>M :Neomake<CR>
nnoremap <leader>m :Marks<CR>

nnoremap <leader>N :let @/ = ""<CR>
nnoremap <leader>n :noh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" These really belong in a Denite menu or custom FZF menu

nnoremap [split] <Nop>
nmap <leader>s [split]

nnoremap [split] :Maps<CR>^[split] 

nnoremap [split]n :sp notes.md<CR>

nnoremap [split]e :sp $HOME/.zshenv<CR>

nnoremap [split]a :sp $HOME/dotfiles/alacritty.yml<CR>
nnoremap [split]i :sp $HOME/dotfiles/init.vim<CR>
nnoremap [split]t :sp $HOME/dotfiles/.tmux.conf<CR>
nnoremap [split]v :sp $HOME/dotfiles/init.vim<CR>
nnoremap [split]z :sp $HOME/dotfiles/.zshrc<CR>

nnoremap [split]d :sp $HOME/Notes/TODO.md<CR>
nnoremap [split]m :sp $HOME/Notes/MACHINE-LEARNING.md<CR>
nnoremap [split]o :sp $HOME/Notes/ONCALL.md<CR>
nnoremap [split]q :sp $HOME/Notes/QUESTIONS.md<CR>
nnoremap [split]r :sp $HOME/Notes/RETRO.md<CR>
nnoremap [split]s :sp $HOME/Notes/SCRUM.md<CR>
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
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '20%'})

" " FZF Yanks, requires svermeulen/vim-easyclip
" function! s:yank_list()
"   redir => l:ys
"   silent Yanks
"   redir END
"   return split(l:ys, '\n')[1:]
" endfunction

" function! s:yank_handler(reg)
"   if empty(a:reg)
"     echo 'aborted register paste'
"   else
"     let l:token = split(a:reg, ' ')
"     execute 'Paste' . l:token[0]
"   endif
" endfunction

" command! FZFYank call fzf#run({
"       \ 'source': <sid>yank_list(),
"       \ 'sink': function('<sid>yank_handler'),
"       \ 'options': '-m',
"       \ 'down': 12
"       \ })

nnoremap <leader>y :Denite neoyank<CR>
nnoremap <leader>Y :DeniteCursorWord neoyank<CR>

" TODO: BCommits and Commits
" Q: What should <leader>? do

nnoremap <C-s> :BLines<CR>

nnoremap <leader># :BLines <C-r><C-w><CR>
nnoremap <leader>* :Rg <C-r><C-w><CR>
" nnoremap <leader>/ :Rg ^<CR>
nnoremap <leader>/ :execute 'Rg ' . input('Rg/')<CR>

" I'm not too sure about these
nnoremap <leader><BS> :History:<CR>
nnoremap <leader><C-r> :History:<CR>
nnoremap <leader><C-s> :History/<CR>

nnoremap <leader><leader> :Commands<CR>

nnoremap <leader>? :GFiles?<CR>

nnoremap <leader>F :Filetypes<CR>
nnoremap <leader>H :History<CR>
nnoremap <leader>L :Lines<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>

" Tags
nnoremap <leader><C-t> :call jobstart("ctags -R -f tags &")<CR>
nnoremap <leader>J :Tags<CR>
nnoremap <leader>j :BTags<CR>
nnoremap <leader>T :Tags<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>] :Tags <C-r><C-w><CR>

nnoremap <leader>k :Helptags<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>r :History<CR>

"""""""
" Vimux
"
" TODO: send region, selection, line to pane n
" Q: Vimux has been problematic w/ IPython lately

nnoremap [vimux] <Nop>
nmap <leader>v [vimux]
vmap <leader>v [vimux]

nnoremap [vimux]<leader> :let g:VimuxRunnerIndex=

" Can I get the LastCommand pre-populated from last session?
nnoremap [vimux] :Maps<CR>^[vimux] 
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
  call VimuxSendKeys('Enter')  " IPython doesn't seem to like this
endfunction

function! VimuxLine()
  call VimuxSendText(getline('.'))
  call VimuxSendKeys('Enter')
endfunction

" vmap [vimux]s "vy :call VimuxSlime()<CR>
" nmap [vimux]s vip[vimux]s<CR>


"""""""""""
""" autocmd

" .md is more often markdown than modula-2
au BufNewFile,BufReadPost *.md set filetype=markdown

augroup event_cursorhold
  autocmd!

  " Autoupdate all on CursorHold (so won't rewrite unless changed)
  " au CursorHold * nested :update

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

" Git
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
  autocmd CmdlineEnter *.py update
  autocmd CmdlineLeave *.py update
  autocmd CursorHold *.py :update
  autocmd FocusLost *.py :update
augroup END

let g:neomake_clojure_enabled_makers = ['kibit']

" Useful: 'pip list --outdated'

"""""""""""""""
""" colorscheme

" true colors inside tmux evidently
if has('termguicolors')
  execute "set t_8f=\e[38;2;%lu;%lu;%lum"
  execute "set t_8b=\e[48;2;%lu;%lu;%lum"
  set termguicolors
end

let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" solarized8
let g:solarized_term_italics = 1
" let g:solarized_termtrans = 1  " faster scrolling
" let g:solarized_diffmode = 'high'
" high visibility is broken for solarized light
" let g:solarized_visibility = 'high'

set background=dark
colorscheme base16-bright
" colorscheme base16-tomorrow-night
" colorscheme base16-atelier-dune-light
" colorscheme nord
" colorscheme gruvbox
" colorscheme solarized8
" colorscheme zenburn

" Transparent background for faster scrolling
" hi! Normal guibg=NONE
