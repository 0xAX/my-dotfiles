;;; .emacs --- My init file for GNU Emacs  -*- lexical-binding: t -*-
;;
;; Author:  Alexander Kuleshov <kuleshovmail@gmail.com>
;; URL:     https://github.com/0xAX/med
;;
;; License: See LICENSE file.
;;
;;                                                                
;;                                                          dddddddd
;;                                                          d::::::d
;;                                                          d::::::d
;;                                                          d::::::d
;;                                                        d:::::d 
;;     mmmmmmm    mmmmmmm       eeeeeeeeeeee        ddddddddd:::::d 
;;   mm:::::::m  m:::::::mm   ee::::::::::::ee    dd::::::::::::::d 
;;  m::::::::::mm::::::::::m e::::::eeeee:::::ee d::::::::::::::::d 
;;  m::::::::::::::::::::::me::::::e     e:::::ed:::::::ddddd:::::d 
;;  m:::::mmm::::::mmm:::::me:::::::eeeee::::::ed::::::d    d:::::d 
;;  m::::m   m::::m   m::::me:::::::::::::::::e d:::::d     d:::::d 
;;  m::::m   m::::m   m::::me::::::eeeeeeeeeee  d:::::d     d:::::d 
;;  m::::m   m::::m   m::::me:::::::e           d:::::d     d:::::d 
;;  m::::m   m::::m   m::::me::::::::e          d::::::ddddd::::::dd
;;  m::::m   m::::m   m::::m e::::::::eeeeeeee   d:::::::::::::::::d
;;  m::::m   m::::m   m::::m  ee:::::::::::::e    d:::::::::ddd::::d
;;  mmmmmm   mmmmmm   mmmmmm    eeeeeeeeeeeeee     ddddddddd   ddddd

;; If we are using i3wm, load related configuration
(let*
    ((i3-socket (shell-command-to-string "i3 --get-socketpath"))
     (i3 (file-exists-p (replace-regexp-in-string "\n$" "" i3-socket))))
  (if i3
      (load "~/.emacscore/desktop/i3.el")))

;; Load Standard routines that may be used in other elisp files
(load "~/.emacscore/utils.el")

;; do not save sessions
(desktop-save-mode 0)
;; Delete text in selection mode when typing
(delete-selection-mode 1)

;; Current locales
(prefer-coding-system        'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-selection-coding-system 'utf-8)
(setq locale-coding-system   'utf-8)
(setq current-language-environment "UTF-8")

;; do not remove new line at the end of buffer
(setq mode-require-final-newline t)

;; Prevent creation of backup files
(setq make-backup-files         nil)
(setq auto-save-list-file-name  nil)
(setq auto-save-default         nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;        Package manager
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(if (version< emacs-version "27.0")
    (package-initialize))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;        Load other extensions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ui
(load "~/.emacscore/text-utils.el")
(load "~/.emacscore/keybindings.el")
(load "~/.emacscore/org/orgmode.el")
(load "~/.emacscore/ido.el")
(load "~/.emacscore/dired.el")
(load "~/.emacscore/ui.el")

;; Development
(load "~/.emacscore/dev/elisp.el")
(load "~/.emacscore/dev/erlang.el")
(load "~/.emacscore/dev/elixir.el")
(load "~/.emacscore/dev/c.el")
(load "~/.emacscore/dev/golang.el")
(load "~/.emacscore/dev/rust.el")
(load "~/.emacscore/term.el")
(load "~/.emacscore/vcs/magit.el")

;; finally loaded everything
(message "All done, %s%s" (user-login-name) ".")

(custom-set-variables
 '(indent-tabs-mode nil)
 '(package-selected-packages (quote (magit bison-mode))))
