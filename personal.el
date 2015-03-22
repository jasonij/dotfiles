;;; personal.el --- Summary
;;;
;;; Commentary:
;;;
;;; This contains personal modifications to the Emacs Prelude set of default packages.


;;; Code:

;;;;;;;;;;;;;;;;
;;; Prelude mods

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)


;;;;;;
;; ESS

(prelude-require-package 'ess)
(require 'ess-site)


;;;;;;;;;;;;
;; Evil-Mode

(setq evil-want-C-u-scroll t)
(setq evil-want-C-d-scroll t)

(prelude-require-package 'evil)
(require 'evil)

(evil-mode 1)
(key-chord-mode -1)

(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq evil-emacs-state-modes nil)

(evil-set-initial-state 'comint-mode 'emacs)
(evil-set-initial-state 'shell-mode 'emacs)
(evil-set-initial-state 'eshell-mode 'emacs)
(evil-set-initial-state 'term-mode 'emacs)
(evil-set-initial-state 'shell-compile-mode 'emacs)
(evil-set-initial-state 'R-mode 'emacs)
(evil-set-initial-state 'inf-ruby-mode 'emacs)
(evil-set-initial-state 'inferior-python-mode 'emacs)
(evil-set-initial-state 'inferior-ess-mode 'emacs)

(define-key evil-normal-state-map ";" 'evil-ex)
(define-key evil-normal-state-map ":" 'evil-repeat-find-char)
(define-key evil-motion-state-map ";" 'evil-ex)
(define-key evil-motion-state-map ":" 'evil-repeat-find-char)

(global-set-key [(control h)] 'backward-delete-char-untabify)
(define-key evil-normal-state-map [(control h)] 'evil-backward-char)


;;;;;;;;;;;
;; Movement

(global-set-key (kbd "<C-tab>") 'next-multiframe-window)
(global-set-key (kbd "<C-S-tab>") 'previous-multiframe-window)

;; this one for my arch linux box
(global-set-key (kbd "<C-S-iso-lefttab>") 'previous-multiframe-window)

(global-set-key (kbd "M-h")  'windmove-left)
(global-set-key (kbd "M-j")  'windmove-down)
(global-set-key (kbd "M-k")    'windmove-up)
(global-set-key (kbd "M-l") 'windmove-right)


;;;;;;;;;;;;;
;; Aesthetics

(scroll-bar-mode -1)

(if (eq system-type 'darwin)
    (set-frame-font "-apple-Menlo-light-normal-normal-*-14-*-*-*-m-0-iso10646-1")
  (set-default-font "Inconsolata-13")
)

;;(prelude-require-package 'color-theme-sanityinc-solarized)
(disable-theme 'zenburn)
;;(load-theme 'sanityinc-solarized-dark)
(load-theme 'wombat)


(prelude-require-package 'golden-ratio)

(global-whitespace-mode 1)


;;;;;;;;;;;;
;; Font size

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)


;;;;;;;;;
;; Python

(prelude-require-package 'elpy)
(setq python-shell-interpreter "ipython")
(elpy-enable)
(elpy-use-ipython)
(setq python-shell-interpreter-args "--pylab") ;; for plotting


;;;;;;;;
;; Scala

;; load the ensime lisp code...
;;(add-to-list 'load-path "ENSIME_ROOT/src/main/elisp/")

(prelude-require-package 'ensime)
(require 'ensime)

;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer. You may have to customize this step
;; if you're not using the standard scala mode.
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)


;;;;;;;;;;;;;;
;; Development

;;(add-hook 'find-file-hook 'flymake-find-file-hook)
;;(add-hook 'after-init-hook #'global-flycheck-mode)

(prelude-require-package 'emacs-eclim)
(require 'eclim)
(global-eclim-mode)

(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

;; mac-only!
;(setenv "JAVA_HOME" "/Library/Java/JavaVirtualMachines/jdk1.7.0_55.jdk/Contents/Home")

(setenv "SBT_OPTS" "-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M")

(setenv "ESHELL" "/usr/bin/zsh")
(setenv "SHELL" "/usr/bin/zsh")

(provide 'personal)
;;; personal.el ends here
