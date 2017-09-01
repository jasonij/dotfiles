;; This is a generic .emacs file

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(nil nil t)
 '(package-selected-packages
   (quote
    (better-registers better-shell better-defaults counsel color-theme color-theme-approximate color-theme-buffer-local color-theme-modern color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow color-theme-solarized solarized-theme markdown-edit-indirect markdown-mode markdown-mode+ markdown-preview-eww markdown-preview-mode markdown-toc markdownfmt evil-visualstar evil-visual-replace evil-visual-mark-mode evil-vimish-fold evil-tutor-ja evil-textobj-column evil-textobj-anyblock evil-text-object-python evil-test-helpers evil-terminal-cursor-changer evil-tabs evil-swap-keys evil-space evil-smartparens evil-search-highlight-persist evil-rsi evil-replace-with-register evil-rails evil-quickscope evil-paredit evil-org evil-opener evil-nerd-commenter evil-multiedit evil-mu4e evil-mc-extras evil-matchit evil-mark-replace evil-magit evil-lispy evil-lisp-state evil-lion evil-leader evil-indent-textobject evil-indent-plus evil-iedit-state evil-god-state evil-find-char-pinyin evil-extra-operator evil-exchange evil-escape evil-embrace evil-ediff evil-easymotion evil-dvorak evil-commentary evil-colemak-minimal evil-colemak-basics evil-cleverparens evil-avy evil-args evil-anzu))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

(require 'evil-matchit)
(global-evil-matchit-mode 1)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-c r") 'counsel-rg)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

(require 'color-theme)
(require 'color-theme-solarized)
(color-theme-initialize)
(color-theme-solarized-light)
