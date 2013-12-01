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
     ))

(mapc 'install-if-needed to-install)

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
(require 'persp-mode) (persp-mode t)
(require 'emmet-mode)
(require 'key-chord)
(require 'multiple-cursors)

;;;; a bit more for autocomplete
(require 'auto-complete-config)
(ac-config-default)

;; now configure some packages in their own .el file
(require 'setup-ido)
(require 'setup-projectile)
(require 'setup-smartparens)
(require 'setup-guidekey)
(require 'setup-highlight-indentation)
(require 'setup-modeline)
;;(require 'setup-magit)

;; setup languages
(require 'setup-langs)

(provide '_packages)
