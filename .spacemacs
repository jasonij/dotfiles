;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; --------------------------------------------------------
     ;; Example of useful layers you may want to use right away
     ;; Uncomment a layer name and press C-c C-c to install it
     ;; --------------------------------------------------------
     auto-completion
     better-defaults
     clojure
     elixir
     emacs-lisp
     erlang
     ess
     (evil-snipe :variables
                 evil-snipe-enable-alternate-f-and-t-behaviors t)
     (git :variables
          git-gutter-use-fringe t)
     github
     haml
     (haskell :variables
              haskell-enable-ghc-mod-support t)
     html
     idris
     javascript
     latex
     markdown
     ocaml
     org
     osx
     (perspectives :variables
                   perspective-enable-persp-projectile t)
     python
     ruby
     ruby-on-rails
     rust
     scala
     (shell :variables
            shell-default-shell 'eshell
            shell-default-term-shell "zsh")
     syntax-checking
     themes-megapack
     unimpaired
     version-control
     vim-empty-lines
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages
   '(
     base16-theme
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   ;; TODO: remove evil-lisp-state from exclusions (it got mangled on Nov 22nd 2015)
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progess in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to a .PNG file.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-light
                         solarized-dark
                         spacemacs-light
                         spacemacs-dark
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color.
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
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; Default value is `cache'.
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native t
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  (setq-default
   ruby-enable-ruby-on-rails-support t
   ruby-version-manager 'rbenv
   )
  )

(defun dotspacemacs/config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super)

  (setq ns-use-native-fullscreen nil)

  ;; Not sure these accomplish anything
  (setq comint-move-point-for-output nil)
  (setq comint-scroll-show-maximum-output nil)

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

  ;; From jaycotton https://github.com/bbatsov/projectile/issues/683#issuecomment-131570808
  ;; Allows projectile-find-tag to have > 511 entries.
  (defun my-expand-completion-table (orig-fun &rest args)
    "Extract all symbols from COMPLETION-TABLE before calling projectile--tags."
    (let ((completion-table (all-completions "" (car args))))
      (funcall orig-fun completion-table)))

  (advice-add 'projectile--tags :around #'my-expand-completion-table)

  ;; For eshell aliases
  ;;(require 'em-alias)
  ;;(setq eshell-aliases-file "~/.emacs.d/eshell/alias")
  )

;; TODO
;;
;; '(default ((t (:background nil))))
;; Fix perspectives if possible (name is off by one, etc)
;; Get Helm and Projectile to agree on exclusions (e.g., in S-/ where bower_components is included)
;; Get delete to work in zsh
;; What's the right way to switch between branches in version control? (magit keeps not noticing in buffers)
;; autocomplete could stand to work with julia, spacemacs julia support is not great
;; autosave or something in prog-mode ?
;; can I get zsh aliases into eshell?
;; get magit to open diffed files in other window
;; let's get vim-like tab completion (Tab for complete, C-N and C-P for cycling)
;; magit refresh g doesn't work in evil-mode
;; magit-blame-quit needs a bloomin' hotkey
;; neotree and magit-status still don't jive
;; use spacemacs-light theme in terminal, solarized-light in gui
;; Can I use the same meta key in terminal and gui?
;; magit is not working great in emacs25, let's stay with git cli
;; should I just default to spacemacs-light so that terminals work better?
;; what is the best pattern for keeping emacs up as a daemon? (for terminal and gui)
;; zoom-frame does not work well in fullscreen
;; I want allowable line lengths of say 100 to 120 across languages
;; What about common tmux pane manipulations like C-a { ? How about C-w { ?
;; julia? use develop branch instead?

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (tern alert helm-core bind-map smartparens ws-butler spaceline restart-emacs persp-mode osx-trash lorem-ipsum jbeans-theme help-fns+ helm-flx helm-company github-clone farmhouse-theme evil-mc evil-magit evil-indent-plus auto-compile ace-jump-helm-line markdown-mode js2-mode haml-mode gitignore-mode git-commit flycheck auctex anaconda-mode evil-leader evil package-build bind-key s ess haskell-mode helm magit async robe linum-relative cider zonokai-theme zenburn-theme zen-and-art-theme window-numbering which-key web-mode web-beautify volatile-highlights utop use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tuareg tronesque-theme toxi-theme toml-mode toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spray spacemacs-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling smeargle slim-mode shm shell-pop seti-theme scss-mode sass-mode ruby-tools ruby-test-mode ruby-end reverse-theme reveal-in-osx-finder rbenv rainbow-delimiters racer queue quelpa pyvenv pytest pyenv-mode purple-haze-theme projectile-rails professional-theme powerline popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-projectile pcre2el pbcopy pastels-on-dark-theme paradox page-break-lines organic-green-theme org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file oldlace-theme ocp-indent occidental-theme obsidian-theme noflet noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term move-text monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme merlin material-theme markdown-toc magit-gitflow magit-gh-pulls macrostep lush-theme light-soap-theme leuven-theme less-css-mode launchctl json-mode js2-refactor js-doc jazz-theme jade-mode ir-black-theme inkpot-theme info+ indent-guide idris-mode ido-vertical-mode hy-mode hungry-delete htmlize hindent highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-descbinds helm-css-scss helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh-md gandalf-theme flycheck-rust flycheck-pos-tip flycheck-haskell flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator feature-mode fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-snipe evil-search-highlight-persist evil-org evil-numbers evil-nerd-commenter evil-matchit evil-lisp-state evil-jumper evil-indent-textobject evil-iedit-state evil-exchange evil-escape evil-args evil-anzu ess-smart-equals ess-R-object-popup ess-R-data-view espresso-theme eshell-prompt-extras esh-help erlang ensime enh-ruby-mode emmet-mode elisp-slime-nav django-theme diff-hl define-word darktooth-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web company-tern company-statistics company-racer company-quickhelp company-ghc company-cabal company-auctex company-anaconda colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmm-mode clues-theme clj-refactor clean-aindent-mode cider-eval-sexp-fu cherry-blossom-theme busybee-theme bundler buffer-move bubbleberry-theme birds-of-paradise-plus-theme base16-theme auto-yasnippet auto-highlight-symbol auto-dictionary apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme align-cljlet alect-themes alchemist aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
