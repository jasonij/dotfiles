;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; (default nil)
   dotspacemacs-enable-lazy-installation nil
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     (c-c++ :variables
            c-c++-enable-clang-support t)
     (clojure :variables
              clojure-enable-fancify-symbols)
     elixir
     emacs-lisp
     erlang
     git
     ess
     (evil-snipe :variables
                 evil-snipe-enable-alternate-f-and-t-behaviors t)
     (git :variables
          git-gutter-use-fringe t)
     github
     (haskell :variables
              haskell-enable-ghc-mod-support t)
     html
     idris
     java
     javascript
     latex
     markdown
     ocaml
     org
     osx
     python
     (ruby :variables
           ruby-test-runner 'ruby-test)
     ruby-on-rails
     rust
     scala
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'eshell
            shell-default-term-shell "zsh")
     spell-checking
     syntax-checking
     themes-megapack
     tmux
     version-control
     vim-empty-lines
     vinegar
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
    base16-theme
    paredit
    multiple-cursors
    edn
    inflections
    )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-light
                         spacemacs-dark
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-command-key "SPC"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native t
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq-default
   ruby-enable-ruby-on-rails-support t
   ruby-version-manager 'rbenv
   )
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  ;; (setq mac-command-modifier 'meta)
  ;; (setq mac-option-modifier 'super)

  (setq magit-repository-directories '("~/Code/"))

  (setq ns-use-native-fullscreen nil)

  ;; Not sure these accomplish anything
  ;; (setq comint-move-point-for-output nil)
  ;; (setq comint-scroll-show-maximum-output nil)

  (setq tags-add-tables nil)

  (setq tooltip-use-echo-area t)

  (setq py-python-command "python3")
  (setq python-shell-interpreter 'python3)
  (setq neo-vc-integration nil) ;; do you remember what this does?

  ;; Avoid the default and use homebrew's
  ;; TODO: need to have some separate Mac & Linux config blocks
  (setq inferior-julia-program-name "/usr/local/bin/julia")

  ;; HEADS UP this is not great but we're wasting time on this
  (setq projectile-globally-ignored-directories
    (append '(".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn")
            '("bower_components" "node_modules" "public" "dev-server" "karma-test")))

  ;; Watch out for this one on other projects
  (setq projectile-globally-ignored-file-suffixes
        '("min" "js" "min.js"))

  (global-set-key (kbd "<C-tab>") 'next-multiframe-window)
  (global-set-key (kbd "<C-S-tab>") 'previous-multiframe-window)
  ;; this one for my arch linux box
  (global-set-key (kbd "<C-S-iso-lefttab>") 'previous-multiframe-window)

  (global-set-key (kbd "<s-tab>") 'next-multiframe-window)
  (global-set-key (kbd "<S-s-tab>") 'previous-multiframe-window)

  (global-set-key (kbd "s-h") 'evil-window-left)
  (global-set-key (kbd "s-j") 'evil-window-down)
  (global-set-key (kbd "s-k") 'evil-window-up)
  (global-set-key (kbd "s-l") 'evil-window-right)

  (setenv "SBT_OPTS" "-Xms510M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M")

  (setq vc-follow-symlinks t)

  (setq powerline-default-separator 'nil)

  ;; vim-gitgutter keystrokes
  (define-key evil-normal-state-map (kbd "[ c") 'version-control/previous-hunk)
  (define-key evil-normal-state-map (kbd "] c") 'version-control/next-hunk)

  ;; From jaycotton https://github.com/bbatsov/projectile/issues/683#issuecomment-131570808
  ;; Allows projectile-find-tag to have > 511 entries.
  (defun my-expand-completion-table (orig-fun &rest args)
    "Extract all symbols from COMPLETION-TABLE before calling projectile--tags."
    (let ((completion-table (all-completions "" (car args))))
      (funcall orig-fun completion-table)))

  (advice-add 'projectile--tags :around #'my-expand-completion-table)

  )

;; TODO
;;
;; Get Helm and Projectile to agree on exclusions (e.g., in S-/ where bower_components is included)
;; Get delete to work in zsh
;; What's the right way to switch between branches in version control? (magit keeps not noticing in buffers)
;; autosave or something in prog-mode ?
;; can I get zsh aliases into eshell? alias | sed -E "s/^(.*)='?(.*)/alias \1 \2/" | sed -E "s/'$//" - but do I actually want this?
;; get magit to open diffed files in other window
;; let's get vim-like tab completion (Tab for complete, C-N and C-P for cycling)
;; magit refresh g doesn't work in evil-mode
;; neotree and magit-status still don't jive
;; Can I use the same meta key in terminal and gui?
;; magit is not working great in emacs25, let's stay with git cli
;; should I just default to spacemacs-light so that terminals work better?
;; what is the best pattern for keeping emacs up as a daemon? (for terminal and gui)
;; zoom-frame does not work well in fullscreen
;; I want allowable line lengths of say 100 to 120 across languages
;; What about common tmux pane manipulations like C-a { ? How about C-w { ?
;; julia? use develop branch instead?
;; fix the problem where emacs rbenv is inserting the shell stuff into your path again (undoing custom path precedence like knife)
;; set up shortcuts to common files (notes, retro_notes, etc)
;; s-Tab is nice in autocomplete, but C-k and cursor-up need to work too
;; julia sometimes stops line-feeding, it gets one-off
;; split off obvious emacs/spacemacs bugs or bad ux into a separate file
;; QuantEcon shows up twice in autocompletions, the second one means to have ".jl" attached
;; Try importing some of your vim/tmux shortcuts and check for other tpope ports
;; Consider using the deoplete/vim-standard autocompletion keys
;;
;; What's with linefeeds in the clojure repl? Linum or evil-related!?
;;
;; super-fast hot-keys for my frequent files
;; How to you want to handle rapid navigation to non-project files like lein and sbt configs?

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol t)
 '(package-selected-packages
   (quote
    (packed auctex package-build deferred auctex-latexmk solarized-theme git-gutter scala-mode company julia-mode helm git-commit powerline sbt-mode elixir-mode multiple-cursors iedit smartparens bind-map evil flycheck projectile helm-core avy markdown-mode alert magit-popup hydra rust-mode s flyspell-correct cider clojure-mode ess haskell-mode yasnippet magit async js2-mode dash uuidgen org-download livid-mode skewer-mode simple-httpd live-py-mode link-hint helm-hoogle eyebrowse evil-visual-mark-mode evil-ediff eshell-z column-enforce-mode clojure-snippets request zonokai-theme zenburn-theme zen-and-art-theme yaml-mode xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights utop use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tuareg tronesque-theme toxi-theme toml-mode toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spacemacs-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling smeargle slim-mode shm shell-pop seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-end rubocop rspec-mode robe reverse-theme reveal-in-osx-finder restart-emacs rbenv rainbow-delimiters railscasts-theme racer quelpa pyvenv pytest pyenv-mode py-yapf purple-haze-theme projectile-rails professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pbcopy pastels-on-dark-theme paradox page-break-lines osx-trash orgit organic-green-theme org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file omtose-phellack-theme oldlace-theme ocp-indent occidental-theme obsidian-theme noflet noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme merlin material-theme markdown-toc majapahit-theme magit-gitflow magit-gh-pulls macrostep lush-theme lorem-ipsum linum-relative light-soap-theme leuven-theme less-css-mode launchctl json-mode js2-refactor js-doc jbeans-theme jazz-theme jade-mode ir-black-theme inkpot-theme info+ indent-guide idris-mode ido-vertical-mode hy-mode hungry-delete htmlize hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flyspell helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md gandalf-theme flycheck-rust flycheck-pos-tip flycheck-haskell flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator feature-mode farmhouse-theme fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-snipe evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu ess-smart-equals ess-R-object-popup ess-R-data-view espresso-theme eshell-prompt-extras esh-help erlang ensime emmet-mode emacs-eclim elisp-slime-nav dracula-theme django-theme disaster diff-hl define-word darktooth-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web company-tern company-statistics company-racer company-quickhelp company-ghc company-cabal company-c-headers company-auctex company-anaconda colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmm-mode cmake-mode clues-theme clj-refactor clean-aindent-mode clang-format cider-eval-sexp-fu chruby cherry-blossom-theme busybee-theme bundler buffer-move bubbleberry-theme bracketed-paste birds-of-paradise-plus-theme base16-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes alchemist aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
