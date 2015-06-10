;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;        Modes for different markups
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
;; YAML mode
;;
(add-to-list 'load-path "~/.emacs.d/yaml")
(require 'yaml-mode)

;;
;; Markdown mode
;;
(add-to-list 'load-path "~/.emacs.d/markdown")
(require 'markdown-mode)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)

;;
;; restructuredTest mode
;;
(load "~/.emacs.d/lisp/rst.el")
(require 'rst)

;;
;; XML
;;
(setq nxml-mode-hook
    '(lambda ()
 (setq tab-width        2
       indent-tabs-mode nil)
       (set-variable 'nxml-child-indent     2)
       (set-variable 'nxml-attribute-indent 2)
       ))

;;
;; json
;;
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
