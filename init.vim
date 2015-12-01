" Vim is a player's racquet
"
" C-h broken? See https://github.com/neovim/neovim/issues/2048
"
" TODO:
" <leader>/ could analog coh
" Ace-Jump line mode?
" Can I get Syntastic to run Rubocop?
" Can we get C-Tab to cycle through vim windows?
" Consider making gv come on after visual exit
" Go between tests and instances
" How to get auto-corrections from spell checking??
" NERDTree ignores my ignores on the first opening
" RuboCop!!! Fscking modes don't use local leader!
" SlimeConfig may get confused with C-6
" Unite sometimes enters in paste mode, that's atrocious.
" What about a splitting version of C-] ?
" What is the ] for next syntastic error?
" When I delete a buffer, the window shouldn't close, instead the next buffer
" can I get tmux paste to trigger paste mode in neovim?
" d-J and d-K for column seek delete? make orthogonal?
" how integrated do I really want vim and tmux to be?
" leader combo for delete current buffer and swap to previous
" leader mappings for available prefixes (a, h (git gutter uses me), m, j, k, i, o, p, z)
" should pop into that window. (more emacs-like)
" splits often scroll in a way I don't like
" use C-o more often
" Is there something analogous to M-q for wrapping?
" Get rid of NERDTree -> netrw seems to be working? Oh no, still broken.
" Get rid of Syntastic -> use NeoMake
" Possibly replace NeoBundle with Plug
" Possibly <leader>hjkl for pane navigation?


"""""""""""""
""" NeoBundle

set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

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
NeoBundle 'plasticboy/vim-markdown'

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
NeoBundle 'ensime/ensime-vim'

" Tmux
NeoBundle 'benmills/vimux'
NeoBundle 'christoomey/vim-tmux-navigator'
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

"" Shougo
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neoyank.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {'build' : {'mac' : 'make -f make_mac.mak', 'unix' : 'make -f make_unix.mak'}}

"" et al
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'terryma/vim-multiple-cursors'

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

let g:unite_source_history_yank_enable = 1

""" we need a way to set wildignore based on project type. e.g., ignore bin in scala but not in python
set wildignore=*.class,*.cache,.chef,target/,project/target/,project/project,project/boot,project/plugins/project/,tags,vcr_cassettes,__pycache__,*.pyc,*.ipynb,.ensime_cache/,node_modules/,bower_components/,dev-server/,bower/
call unite#custom#source('file_rec,file_rec/async', 'ignore_globs', split(&wildignore, ','))
call unite#custom#source('grep', 'matchers', 'matcher_fuzzy')
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])


"""""""
""" let

let base16colorspace=256

" spacemacs!
let mapleader=" "
let maplocalleader="\\"

let g:deoplete#enable_at_startup = 1

let g:haddock_browser = "firefox"

let g:NERDTreeWinSize=50

" netrw is buggy stop using it
" wait, did neovim fix it?
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

let g:vimrubocop_config = '~/.rubocop.yml'
let g:vimrubocop_keymap = 0
nmap <LocalLeader>r :RuboCop<CR>

let g:scala_first_party_namespaces='.*\(cetera\|phidippides\|rammstein\).*'
let g:scala_sort_across_groups=1
let g:scala_use_builtin_tagbar_defs = 0

let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
let g:slime_paste_file = tempname()
let g:slime_python_ipython = 1
let g:slime_target = "tmux"

let g:sneak#streak = 1

" scala has ~test and python has python-mode
" TODO: try this again with neovim, might be async now
" Nope, but there's NeoMake
let g:syntastic_javascript_checkers=[ 'jshint' ]
let g:syntastic_mode_map = { "mode" : "active", "passive_filetypes" : ["python", "scala"] }

"let g:tagbar_width = 45
let g:tagbar_sort = 0

let g:unite_enable_start_insert = 1

let g:airline_powerline_fonts = 1

let g:vim_airline_theme = 'base16'
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_folding_disabled = 1


"""""""
""" set

" Remember to mkdir -p ~/.vim/backup ~/.vim/swap ~/.vim/undo
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set undodir=~/.vim/undo

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
"set number
set previewheight=17
"set relativenumber
set shell=zsh
set shiftwidth=2
set t_Co=256
set tabstop=2
set tags=.tags;
set undofile
set undolevels=1000
set undoreload=10000


""""""""""""""""
""" MAPPINGS!!!!
"
" Inspired by Spacemacs, but going 'viminal'

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
nnoremap <leader>s :split<cr>
nnoremap <leader>v :vsplit<cr>

" Edit Files
nnoremap <leader>ed :e ~/notes/TODO.md<cr>
nnoremap <leader>em :e ~/notes/menu.md<cr>
nnoremap <leader>en :e notes.md<cr>
nnoremap <leader>er :e ~/notes/RETRO_NOTES.md<cr>
nnoremap <leader>et :e ~/dotfiles/.tmux.conf<cr>
nnoremap <leader>ev :e ~/dotfiles/init.vim<cr>
nnoremap <leader>ez :e ~/.zshrc<cr>

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
" TODO: Hey what should we replace this with?? (because we want s back)
nnoremap <leader>sc :let @/ = ""<cr>
nnoremap <leader>/ :UniteWithCursorWord grep:.<cr>

" Toggles
" Let's try this Esc code just to see
inoremap jj <Esc>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>t :TagbarToggle<CR>

" Unite
nnoremap <leader>u :Unite 
nnoremap <leader>ub :Unite buffer bookmark<cr>
nnoremap <leader>uf :Unite file/async<cr>
nnoremap <leader>ug :Unite grep:.<cr>
nnoremap <leader>ul :Unite tmuxcomplete/lines<cr>
nnoremap <leader>ur :Unite file_rec/git<cr>
nnoremap <leader>uR :Unite file_rec/async<cr>
nnoremap <leader>ut :Unite tmuxcomplete<cr>
nnoremap <leader>uy :Unite history/yank<cr>

" Unite shortcuts
nnoremap <leader>b :Unite buffer bookmark<cr>
nnoremap <leader>l :Unite tmuxcomplete/lines<cr>
nnoremap <leader>f :Unite file/async<cr>
nnoremap <leader>R :Unite file_rec/async<cr>
nnoremap <leader>r :Unite file_rec/git<cr>
nnoremap <leader>y :Unite history/yank<cr>

" TODO: you don't actually use these, so either use them or remove them
" Q: Can we replace these with a different prefix to get v back for vsp?
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

" OS X and crontabs. moan. sigh. groan.
autocmd filetype crontab setlocal nobackup nowritebackup

" rainbow_parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"""""""""""""""
""" colorscheme
""" base16 is working again evidently
set background=light
colorscheme solarized
