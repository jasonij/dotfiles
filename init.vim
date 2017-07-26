" Vim is a player's racquet
"
" TODO:
"
" Get NeoMake listing next and previous to work (they aren't relative to cursor position)
" Can I get the quickfix window to follow my cursor position (so next is relative to cursor?)
"
" gggqG (is there something shorter?)
"
" For orgish timestamps: :put =strftime('<%Y-%m-%d %a>')
"
" Subvert more often! e.g., :'<,'>Subvert/categor{y,ies}/tag{,s}/g
"
" Make use of marks! ''
"
" Shortcut Copy current filename into system clipboard (it's already in register %)
"
" aucommand to change wildignore based on project type
"
" Need some kind of `gdt` or `gdt HEAD` shortcut (ideally in fugitive)
" (I feel like we could pop this into Dirvish or something)
"
" Can I get tags to show up on the vim help files?
"
" I would like ]C and [C to go along with ]c and [c (add to git-gutter?)
"
" For Clj I'd like to use omni complete always(?)
" There are many deoplete external sources now
"
" C-HJKL for resizing panes (e.g., 5 C-w >) ?
"
" Can I get help to open in a vertical split instead of horizontal?
"
" Neomake could open :lw automatically?
"
" Look into g:tmuxcomplete#capture_args
"           g:tmuxcomplete#list_args
"
" Project: use actual commands instead of hotkeys for a while
" Useful: some kind of command exposer like Spacemacs has (Denite commands)
"
" DeniteSelection
"
" Tagbar for YAML files?
"
" What can I do about tagging methods inside of bin/ scripts without extensions
"
" Can I get autocomplete on spelling for vim just for note-taking? fzf?
"
" airline (and tmuxline) are problematic on smaller windows (e.g. split screen laptop)
"
" Python binding for import pdb; pdb.set_trace()
"
" BIG TODO: Make sure this works with Vim8 (just in case)
"
" Q: Can I highlight the lines that changed in the last commit (or change to file) without seeing a diff?
"
" cob cob loses the nice color of NeoMake's indicator
"
" guicursor seems to make the cursor lag on C-w hjkl
"
" Can I get auto-center on jumps, like zz after any jump?
"
" Prefix for \"execute next command in split\"
"
" C-S-] or C-} should split and jump to tag (this used to work years ago, what changed?)
"
" Regenerate tags should figure out which tags file we're using and regenerate that one
"
" Maybe if we can't get tmux to name panes, we can have vim call out and do it
"
" vip and %cpaste on like M-ret or S-ret or something like that
"
" Something is monkeyed up with python autocompletion (C-x C-o C-x C-o)
"
" Try to get :History to start populated with the current project's directory
"
" Consider adding Jumps and possibly Changes to FZF
" (I really want to keep leader-key bindings very close to vim, e.g., j for jumps, t for tags)
"
" What about https://github.com/ludovicchabant/vim-gutentags ???
"
" Can I get ci to work for more paired things?
"
" I'd like ]* and [* and possibly ]# and [# for last and first search matches
"
" Stop tagging logs!!! (not just tagging but aging and rging)
"
" Update FZF for Emacs bindings (C-n, C-p, M-n, M-p, unbind C-j and C-k) ???
"
" Python folding (fold methods inside of class, but open class)

" LEARN: (in more depth)
" FZF (it is really fast)
" Fugitive / git (live more in vim or stay console-oriented?)
" Tmux itself (a few issues to dig in on, mostly panes into windows)
" Zsh (mostly wins on autocompletion but let's see what else is there)


""""""""
""" Plug

"" This is non-standard, because I migrated from NeoBundle
"" TODO: rename to plug or whatever is the norm or look into Shougo's new project
call plug#begin('~/.config/nvim/bundle')

" About 80 plugins, that's probably too many (right Spacemacs?)

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" C/C++
Plug 'justmao945/vim-clang'

" Clojure
Plug 'clojure-vim/async-clj-omni'
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'guns/vim-sexp'
Plug 'luochen1990/rainbow'
Plug 'snoe/clj-refactor.nvim'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-salve', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" Data Formats
" Q: What about better YAML support?
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'pearofducks/ansible-vim'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'tmux-plugins/vim-tmux'

" Git
" NOTE: If you have to use something other that git, Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'
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
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'bfredl/nvim-ipy'
Plug 'davidhalter/jedi-vim'
Plug 'tmhedberg/SimpylFold'
Plug 'zchee/deoplete-jedi'

" R
Plug 'jalvesaq/Nvim-R'

" Ruby
Plug 'vim-ruby/vim-ruby'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'sebastianmarkow/deoplete-rust'

" Scala
" See also:
" * https://github.com/vhakulinen/neovim-intellij-complete
" * https://github.com/vhakulinen/neovim-intellij-complete-deoplete
Plug 'derekwyatt/vim-sbt'
Plug 'derekwyatt/vim-scala'

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
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Konfekt/FastFold'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'altercation/vim-colors-solarized'
Plug 'benekastah/neomake'
Plug 'chriskempson/base16-vim'
Plug 'flazz/vim-colorschemes'
Plug 'francoiscabrol/ranger.vim'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/seoul256.vim'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'kassio/neoterm'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'rbgrouleff/bclose.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/BufOnly.vim'

call plug#end()


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

set wildignore+=.tsv,.sql,.gz "Huge tsv and sql files are slowing down denite


"""""""
""" let

let g:deoplete#sources#rust#racer_binary="/Users/jkroll/.cargo/bin/racer"
let g:deoplete#sources#rust#rust_source_path="/Users/jkroll/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"

let g:VimuxRunnerIndex = 2

" let g:airline_theme = 'cool'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:tmuxline_powerline_separators = 0

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

let g:deoplete#sources#jedi#show_docstring = 1

let g:jedi#completions_command = ""
let g:jedi#completions_enabled = 0  " use deoplete jedi should be faster
let g:jedi#documentation_command = "K"
let g:jedi#goto_assignments_command = "<localleader>g"
let g:jedi#goto_command = "<localleader>d"
let g:jedi#rename_command = "<localleader>r"
let g:jedi#usages_command = "<localleader>n"

let NERDTreeHijackNetrw = 0
let NERDTreeWinSize = 45

let g:neoterm_repl_ruby = 'pry'

" Q: Should we use /Users/jkroll/.pyenv/versions/2.7.12/bin/python instead?
" I'm wondering because that's where we try to load the neovim lib from anyway
" let g:python_host_prog = '/Users/jkroll/.pyenv/versions/neovim2/bin/python'
" let g:python3_host_prog = '/Users/jkroll/.pyenv/versions/neovim3/bin/python'
let g:python_host_prog = '/Users/jkroll/.pyenv/versions/2.7.12/bin/python'
let g:python3_host_prog = '/Users/jkroll/.pyenv/versions/3.5.2/bin/python'

let g:ranger_map_keys = 0

let g:scala_sort_across_groups=1
let g:scala_use_builtin_tagbar_defs = 0

let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_import = 0

let g:tmuxcomplete#trigger = ''

let g:tmuxline_preset = 'full'

let g:vimtex_fold_enabled = 1

""""""""
" Tagbar
" NOTE: Keep an eye on universal-ctags; it may eventually add support for these

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
" au CursorHold * checktime

" mkdir -p ~/.config/nvim/backup ~/.config/nvim/swap ~/.config/nvim/undo
set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/swap
set undodir=~/.config/nvim/undo

" TODO: some of these are likely defaults in Neovim, so let's see what we can remove
set cmdheight=1
set cursorline
set encoding=utf-8
set expandtab

" Disable water torture
set guicursor+=a:blinkon0

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    let g:ackprg = 'rg --vimgrep --no-heading'
endif

set hidden
set list
set nofoldenable
set nolazyredraw
set previewheight=17
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
""" HEURISTIC: <leader><key> =~ the command I use most that begins with <key> or sometimes C-w<key>

" Leaders
let mapleader=" "
let maplocalleader=","


"""""
" Vim

nnoremap <leader>= <C-w>=
nnoremap <leader>o :only<CR>
nnoremap <leader>O :BufOnly<CR>
nnoremap <C-w>O :BufOnly<CR>

" Q: What about <leader>a/A ? What makes sense, Abolish, Ag?

" TODO: <leader>C
" Q: Should Bclose possibly live here? If not, what else?
nnoremap <leader>C :Bclose<CR>
nnoremap <leader>c :close<CR>

nnoremap <leader>D :Bclose<CR>
nnoremap <leader>d :bd<CR>

nnoremap <leader>Q :qa<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader>W :wa<CR>
nnoremap <leader>w :w<CR>

nnoremap <leader>X :xa<CR>
nnoremap <leader>x :x<CR>

" these don't really make a ton of sense, especially the first one
nnoremap <leader>Z :w<CR>:Bclose<CR>
nnoremap <leader>z :w<CR>:bd<CR>

" Why are these broken? Because iTerm2
nnoremap <C-Tab> <C-w>w
nnoremap <C-S-Tab> <C-w>W

map <C-S-]> <C-w>s<C-]>
map <C-}> <C-w>s<C-]>

nnoremap <leader><C-w> :Windows<CR>

" Q: What about C-; for consistency w/ tmux?

""""""""
" Denite / FZF

" Ag for file_rec
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Ripgrep command on grep source (awesome!)
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" file_mru takes some work
call denite#custom#source('file_mru', 'converters', ['converter_relative_word'])
call denite#custom#source('file_mru', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])

" Change mappings.
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')

call denite#custom#map('insert', '<C-d>', '<denite:scroll_window_downwards>', 'noremap')
call denite#custom#map('insert', '<C-u>', '<denite:scroll_window_upwards>', 'noremap')

call denite#custom#map('insert', '<C-b>', '<denite:scroll_page_backwards>', 'noremap')
call denite#custom#map('insert', '<C-f>', '<denite:scroll_page_forwards>', 'noremap')

" These two don't really work (invalid int() '' or something)
call denite#custom#map('insert', '<C-e>', '<denite:scroll_down>', 'noremap')
call denite#custom#map('insert', '<C-y>', '<denite:scroll_up>', 'noremap')

" TODO: Figure out more sensible mappings here
call denite#custom#map('insert', '<C-t>', '<denite:move_to_first_line>', 'noremap')
call denite#custom#map('insert', '<C-g>', '<denite:move_to_last_line>', 'noremap')

nnoremap <leader><BS> :Denite -resume<CR>
nnoremap <leader><C-h> :Denite -resume<CR>
nnoremap <leader><C-p> :Denite -resume -select=-1 -immediately<CR>
nnoremap <leader><C-n> :Denite -resume -select=+1 -immediately<CR>

nnoremap <leader>* :Rg <C-r><C-w><CR>
nnoremap <leader>/ :Ag<CR>

" Q: How to handle resume?

nnoremap <leader><leader> :Commands<CR>

nnoremap <leader>B :Denite buffer:!<CR>
nnoremap <leader>b :Buffers<CR>

nnoremap <leader>F :Files<CR>
nnoremap <leader>f :GFiles<CR>

nnoremap <leader>j :BTags<CR>
nnoremap <leader>J :Tags<CR>

nnoremap <leader>K :DeniteCursorWord help<CR>
nnoremap <leader>k :Helptags<CR>

nnoremap <leader>L :Lines<CR>
nnoremap <leader>l :BLines<CR>

nnoremap <leader>R :History<CR>
nnoremap <leader>r :Denite file_mru<CR>

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
" nnoremap [fugitive]f :Git! diff --name-only origin/master<CR>
" nnoremap [fugitive]F :Git diff --name-only origin/master<CR>
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
" Since - is Dirvish, why not _ for Ranger?
nnoremap _ :Ranger<CR>

nnoremap <leader>E :NERDTreeFind<CR>
nnoremap <leader>e :NERDTreeToggle<CR>

" netrw (maybe not really a huge gain over :Se and :Ve)
nnoremap <leader>S :Sexplore<CR>
nnoremap <leader>V :Vexplore<CR>

" Is this a problem with tmux?
noremap <leader>; :Commentary<CR>

" Q: How to send <Esc> inside terminal?
tnoremap <Esc> <C-\><C-n>
" TODO: possibly ' is better for marks?
nnoremap <leader>' :split \| terminal<CR>

" nnoremap <leader>T :call jobstart("ctags --exclude=@$HOME/.ctagsignore -R -f tags-regenerating . && mv tags-regenerating tags")<CR>
nnoremap <leader>T :call jobstart("ctags --exclude=@$HOME/.ctagsignore -R -f tags &")<CR>
nnoremap <leader>t :TagbarToggle<CR>

nnoremap <leader>u :UndotreeToggle<CR>

" This is okay because the filetype determines the maker
" TODO: This is confusing, m should be for like Marks or something
nnoremap <leader>M :Neomake<CR>
nnoremap <leader>m :Marks<CR>

" I have to type this all the bloomin' time
" Why do I have to keep clearing highlights anyway?
" Q: Can't I set a timeout and clear after the timeout?
nnoremap <leader>N :let @/ = ""<CR>
nnoremap <leader>n :noh<CR>

" These really belong in a Denite menu
nnoremap <leader>sn :sp notes.md<CR>

nnoremap <leader>st :sp $HOME/dotfiles/.tmux.conf<CR>
nnoremap <leader>sv :sp $HOME/dotfiles/init.vim<CR>

nnoremap <leader>sd :sp $HOME/Notes/TODO.md<CR>
nnoremap <leader>sm :sp $HOME/Notes/MACHINE-LEARNING.md<CR>
nnoremap <leader>sq :sp $HOME/Notes/QUESTIONS.md<CR>
nnoremap <leader>sr :sp $HOME/Notes/RETRO.md<CR>
nnoremap <leader>ss :sp $HOME/Notes/SCRUM.md<CR>


"""""
" FZF

let g:fzf_history_dir = '~/.local/share/fzf-history'

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
" inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

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

function! VimuxLine()
  call VimuxSendText(getline('.'))
  call VimuxSendKeys("Enter")
endfunction

" These have stopped working since whenever
" Basically, a <CR> in @v will end VimuxSendText
vmap [vimux]s "vy :call VimuxSlime()<CR>
nmap [vimux]s vip[vimux]s<CR>


"""""""""""
""" autocmd

" Autosave all on CursorHold (so won't rewrite unless changed)
autocmd CursorHold * nested :wa


" Clojure
" See https://github.com/benekastah/neomake/issues/15
" Q: Can/should I get Eastwood running too?
au FileType clojure setlocal makeprg=lein\ kibit\ %
au FileType clojure setlocal errorformat=%IAt\ %f:%l:,%C%m,%Z,%-G%.%#
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
au FileType gitcommit setlocal textwidth=74

" NERDTree quit if only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Neomake
autocmd! BufWritePost * Neomake

" OS X and crontabs. moan. sigh. groan.
autocmd filetype crontab setlocal nobackup nowritebackup

" Python
au bufenter *.ipynb set filetype=json
autocmd FileType python nnoremap <buffer> <CR> :call VimuxLine()<CR><CR>
let g:neomake_python_pylama_maker = {
      \ 'args': ['--force', '--format', 'pep8', '--ignore', 'E501']
      \ } " run pylama on Python scripts that don't end in .py


"""""""""""""""
""" colorscheme

" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif

let g:solarized_contrast = "high"
let g:solarized_termtrans = 0
colorscheme solarized
set background=light
