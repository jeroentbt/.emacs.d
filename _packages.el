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
     ;; python stuff
     python-mode ;; better than the built in python.el
     jedi ;; python auto completion
     ;; /python stuff
     flycheck
     dash-at-point ;; search dash.app for stuff at point
     guide-key ;; list available keys
     expand-region
     exec-path-from-shell ;; loads in $PATH (used in _mac.el)
     ))

(mapc 'install-if-needed to-install)

;; simple requires
(require 'editorconfig)
(require 'spaces)
(require 'gist)
(require 'expand-region)

;; now configure some packages in their own .el file
(require 'setup-ido)
(require 'setup-projectile)
(require 'setup-webmode)
(require 'setup-smartparens)
(require 'setup-guidekey)
;;(require 'setup-magit)

;; setup languages
(require 'setup-python)

(provide '_packages)

