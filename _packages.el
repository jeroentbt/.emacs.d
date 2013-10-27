;; Add melpa to package repos

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(zenburn-theme
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
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; now configure some packages in their own .el file
(require 'setup-ido)

(provide '_packages)
;;(require 'setup-magit)
