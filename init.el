;; NOTE: The name of the Org files is important!  When a file gets tangled,
;; it gets the same base name as the Org file.  Thus, tangling Emacs Lisp from
;; a file `init.org` would generate `init.el`, obliterating this file in the
;; process. So your config org file should not be named "init.org".

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set up and enable straight.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq package-enable-at-startup nil)
(setq straight-use-package-by-default t)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; / straight.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; install org in order to be able to tangle
(straight-use-package 'org-contrib)

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
