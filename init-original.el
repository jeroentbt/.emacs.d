;; Set some variables based on environment
;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))


;; Set up load path
(setq loadpath-mine (expand-file-name "conf" user-emacs-directory))
(setq loadpath-vendor (expand-file-name "vendor" user-emacs-directory))

(add-to-list 'load-path loadpath-mine)
(add-to-list 'load-path loadpath-vendor)

(require '_packages)
(require '_global)
(require '_appearance)
(require '_key_bindings)

(require 'theme-park-mode)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(when is-mac (require '_mac))
(put 'narrow-to-region 'disabled nil)
