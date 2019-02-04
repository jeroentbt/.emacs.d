;; Emacs 24 init.el

;; NOTE: The name of the Org files is important!  When a file gets tangled,
;; it gets the same base name as the Org file.  Thus, tangling Emacs Lisp from
;; a file `init.org` would generate `init.el`, obliterating this file in the
;; process. So your config org file should not be named "init.org".

;; Initialize cask to get the correct version of org-mode 

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)


;; only retangle if the org file is newer than the tangled file
(defvar init-source-org-file 
  (expand-file-name "emacs-init.org" 
                    user-emacs-directory)
  "The file that our emacs initialization comes form")

(defvar init-source-el-file 
  (expand-file-name "emacs-init.el" 
                    user-emacs-directory)
  "The file that our emacs initialization is generated into")

(if (file-exists-p init-source-org-file)
  (if (and (file-exists-p init-source-el-file)
           (time-less-p (nth 5 (file-attributes init-source-org-file)) 
                        (nth 5 (file-attributes init-source-el-file))))
      (load-file init-source-el-file)
    (progn (require 'ob-tangle)
           ;; (setq debug-on-error t)
	   (org-babel-load-file init-source-org-file)))
  (load-file init-source-el-file))
