(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))

(package-initialize)

;; refresh packages on launch
;; (package-refresh-contents)

(defun install-if-needed (package)
  (unless (package-installed-p package)
    (package-install package)))

(setq to-install
   '(zenburn-theme
     heroku-theme
     undo-tree
     smooth-scrolling
     flx
     flx-ido
     ido-vertical-mode
     ido-ubiquitous
     ido-at-point
     smex
     magit
     magit-log-edit ;; old commit mode (new one opens in new frame 28/10/2013
     s
     editorconfig
     projectile
     web-mode
     spaces
     emmet-mode
     gist
     smartparens
     auto-complete
     jedi ;; python auto completion
     flycheck
     dash-at-point ;; search dash.app for stuff at point
     guide-key ;; list available keys
     expand-region
     exec-path-from-shell ;; loads in $PATH (used in _mac.el)
     column-marker ;; highlight a (or more) columns (used for 80 column limit)
     highlight-indentation ;; minor mode to highlight indentation
     persp-mode ;; saves window config and buffers
     buffer-move ;; easily move buffers to other windows
     ace-jump-mode ;; C-c SPACE to jump to chars
     smart-mode-line ;; A more readable modeline
     markdown-mode
     key-chord
     multiple-cursors
     php-mode
     js2-mode
     adaptive-wrap ;; indents wrapped lines (indentation by spaces)
     w3m ;; web browsing in emacs (needs w3m installed)
     weechat ;; connects to weechat ("/relay add weechat 9000" in weechat)
     rainbow-delimiters ;; colors [{()}] pairs according to depth (setup via smartparens)
     haste ;; interface to http://hastebin.com/about
     nodejs-repl ;; based on comint-mode https://github.com/abicky/nodejs-repl.el
     js3-mode ;; more node stylish
     repl-toggle ;; bind buffer to repl
     php-boris ;; php repl
     json-mode
     puppet-mode
     popwin ;; pop up window that gets out of the way after use
     erc-hl-nicks
     direx ;; tree explorer
     ace-jump-buffer ;; ace-jump for buffer, duh
     async
     skewer-mode ;; interact with a browser (js (also REPL!), html, css)
     js2-refactor ;; JavaScript refactoring library for emacs
     ))

(mapc 'install-if-needed to-install)

;; load $PATH in to GUI app (see conf/_mac.el for more info)
(when is-mac (exec-path-from-shell-initialize))

;;;; add packages from vendor directory
(dolist (project (directory-files loadpath-vendor t "\\w+"))
 (when (file-directory-p project)
   (add-to-list 'load-path project)))

;; tern is a special case...
(add-to-list 'load-path "~/.tern/emacs")
(autoload 'tern-mode "tern.el" nil t)
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

;; simple requires
(require 'editorconfig)
(require 'spaces)
(require 'gist)
(require 'expand-region)
(require 'column-marker) ;; setup in language setups
(require 'emmet-mode)
(require 'key-chord)
(require 'multiple-cursors)
(autoload 'haste "haste" nil t)
(require 'repl-toggle) ;; config in setup-langs
(require 'popwin) (popwin-mode t) ;; Much more to set up here! https://github.com/m2ym/popwin-el
(require 'ace-jump-buffer)
(require 'epa-file) ;; support for handling .gpg files transparently
(epa-file-enable)

;;;; a bit more for autocomplete
(require 'auto-complete-config)
(ac-config-default)

;; now configure some packages in their own .el file
(require 'setup-ido)
(require 'setup-projectile)
;; (require 'setup-persp)
(require 'setup-smartparens)
(require 'setup-guidekey)
(require 'setup-highlight-indentation)
(require 'setup-modeline)
(require 'setup-weechat)
(require 'setup-znc-erc)
(require 'setup-direx)
(require 'setup-mu4e)
(require 'setup-ibuffer)
;;(require 'setup-magit)

;; setup languages
(require 'setup-langs)

(provide '_packages)
